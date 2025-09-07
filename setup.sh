#!/bin/bash

set -euo pipefail

# Wispra-Zig Setup Script

# Show help message
show_help() {
    cat << EOF
Wispra-Zig Setup Script

USAGE:
    ./setup.sh [OPTIONS]

OPTIONS:
    --interactive    Enable interactive model selection
    --help          Show this help message

DESCRIPTION:
    This script automatically sets up Wispra-Zig with all dependencies:
    
    1. Installs system dependencies (Zig, PortAudio, CMake, etc.)
    2. Downloads and builds whisper.cpp from source
    3. Downloads Whisper AI models (tiny/base/small)
    4. Builds and installs Wispra binaries
    5. Creates systemd service configuration
    6. Sets up default configuration files

EXAMPLES:
    ./setup.sh                    # Automatic setup with default (tiny) model
    ./setup.sh --interactive      # Interactive setup with model selection
    ./setup.sh --help            # Show this help

After setup, start with:
    systemctl --user enable --now wispra
    wispra-ptt start    # (speak)
    wispra-ptt stop     # (transcription appears)

EOF
}

# Check for help flag
if [[ "${1:-}" == "--help" ]] || [[ "${1:-}" == "-h" ]]; then
    show_help
    exit 0
fi

echo "Setting up Wispra-Zig..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're running on a supported system
check_system() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        print_status "Detected Linux system"
        if command -v pacman &> /dev/null; then
            PACKAGE_MANAGER="pacman"
        elif command -v apt &> /dev/null; then
            PACKAGE_MANAGER="apt"
        elif command -v dnf &> /dev/null; then
            PACKAGE_MANAGER="dnf"
        else
            print_error "Unsupported package manager. Please install dependencies manually."
            exit 1
        fi
    else
        print_error "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

# Install system dependencies
install_dependencies() {
    print_status "Installing system dependencies..."
    
    case $PACKAGE_MANAGER in
        "pacman")
            sudo pacman -S --needed zig portaudio cmake make gcc git curl wtype wl-clipboard
            ;;
        "apt")
            sudo apt update
            sudo apt install -y build-essential cmake git curl portaudio19-dev wtype wl-clipboard-tools
            # Install Zig manually on Ubuntu/Debian as it's often outdated in repos
            install_zig_manually
            ;;
        "dnf")
            sudo dnf install -y cmake make gcc-c++ git curl portaudio-devel wtype wl-clipboard
            install_zig_manually
            ;;
    esac
}

# Install Zig manually for systems that don't have recent versions
install_zig_manually() {
    if command -v zig &> /dev/null; then
        ZIG_VERSION=$(zig version)
        print_status "Found Zig: $ZIG_VERSION"
        return
    fi
    
    print_status "Installing Zig..."
    ZIG_VERSION="0.14.1"
    ZIG_ARCHIVE="zig-linux-x86_64-${ZIG_VERSION}.tar.xz"
    
    cd /tmp
    curl -LO "https://ziglang.org/download/${ZIG_VERSION}/${ZIG_ARCHIVE}"
    tar -xf "$ZIG_ARCHIVE"
    
    # Install to ~/.local/bin
    mkdir -p ~/.local/bin
    cp "zig-linux-x86_64-${ZIG_VERSION}/zig" ~/.local/bin/
    
    # Add to PATH if not already there
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        export PATH="$HOME/.local/bin:$PATH"
    fi
    
    print_status "Zig installed to ~/.local/bin/zig"
}

# Setup whisper.cpp
setup_whisper() {
    print_status "Setting up whisper.cpp..."
    
    WHISPER_DIR="./third_party/whisper.cpp"
    
    if [ ! -d "$WHISPER_DIR" ]; then
        mkdir -p third_party
        git clone https://github.com/ggerganov/whisper.cpp.git "$WHISPER_DIR"
    fi
    
    cd "$WHISPER_DIR"
    
    # Build whisper.cpp
    mkdir -p build
    cd build
    cmake ..
    make -j$(nproc)
    
    cd ../../..
    print_status "whisper.cpp built successfully"
}

# Download Whisper models
download_model() {
    print_status "Setting up Whisper models..."
    
    MODEL_DIR="$HOME/.cache/wispra/models"
    mkdir -p "$MODEL_DIR"
    
    # Available models with their URLs and descriptions
    declare -A MODELS
    MODELS[tiny]="ggml-tiny.en-q5_1.bin Fast, less accurate (39 MB)"
    MODELS[base]="ggml-base.en-q5_1.bin Balanced speed/accuracy (57 MB)" 
    MODELS[small]="ggml-small.en-q5_1.bin Better accuracy, slower (244 MB)"
    
    DEFAULT_MODEL="tiny"
    
    echo "Available Whisper models:"
    for model_key in "${!MODELS[@]}"; do
        model_info=(${MODELS[$model_key]})
        model_file="${model_info[0]}"
        model_desc="${model_info[*]:1}"
        echo "  $model_key: $model_desc"
    done
    echo
    
    # Allow user to choose model or use default
    if [[ "${1:-}" == "--interactive" ]]; then
        read -p "Choose model [tiny/base/small] (default: tiny): " CHOSEN_MODEL
        CHOSEN_MODEL="${CHOSEN_MODEL:-$DEFAULT_MODEL}"
    else
        CHOSEN_MODEL="$DEFAULT_MODEL"
        print_status "Using default model: $CHOSEN_MODEL"
    fi
    
    # Validate model choice
    if [[ ! "${MODELS[$CHOSEN_MODEL]+isset}" ]]; then
        print_error "Invalid model choice: $CHOSEN_MODEL"
        exit 1
    fi
    
    model_info=(${MODELS[$CHOSEN_MODEL]})
    MODEL_FILE="${model_info[0]}"
    MODEL_PATH="$MODEL_DIR/$MODEL_FILE"
    
    # Download the chosen model
    if [ ! -f "$MODEL_PATH" ]; then
        print_status "Downloading $CHOSEN_MODEL model: $MODEL_FILE..."
        
        cd "$MODEL_DIR"
        
        # Download with progress bar and error checking
        if curl -L --fail --progress-bar \
             -o "$MODEL_FILE.tmp" \
             "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/$MODEL_FILE"; then
            
            # Move to final location only on successful download
            mv "$MODEL_FILE.tmp" "$MODEL_FILE"
            print_status "Model downloaded successfully to $MODEL_PATH"
            
            # Display file size for verification
            MODEL_SIZE=$(du -h "$MODEL_FILE" | cut -f1)
            print_status "Model size: $MODEL_SIZE"
        else
            print_error "Failed to download model. Please check your internet connection."
            rm -f "$MODEL_FILE.tmp"
            exit 1
        fi
    else
        print_status "Model already exists: $MODEL_PATH"
        MODEL_SIZE=$(du -h "$MODEL_PATH" | cut -f1)
        print_status "Model size: $MODEL_SIZE"
    fi
    
    # Update config file with the chosen model
    update_config_model "$MODEL_PATH"
}

# Update config file with the correct model path
update_config_model() {
    local model_path="$1"
    local config_file="$HOME/.config/wispra/config.toml"
    
    if [ -f "$config_file" ]; then
        # Replace the model path in the config
        sed -i "s|path = \".*\"|path = \"$model_path\"|" "$config_file"
        print_status "Updated config with model path: $model_path"
    fi
}

# Update build.zig with correct paths
update_build_config() {
    print_status "Updating build configuration..."
    
    WHISPER_ROOT="$(pwd)/third_party/whisper.cpp"
    WHISPER_BUILD="$(pwd)/third_party/whisper.cpp/build"
    
    # Create a build.zig with proper paths
    cat > build.zig << EOF
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Build wisprad daemon
    const wisprad = b.addExecutable(.{
        .name = "wisprad",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    
    // Link with system libraries
    wisprad.linkLibC();
    wisprad.linkLibCpp();
    wisprad.linkSystemLibrary("portaudio");
    wisprad.linkSystemLibrary("pthread");
    wisprad.linkSystemLibrary("dl");
    wisprad.linkSystemLibrary("m"); // math library

    // Whisper.cpp integration
    const whisper_root = "${WHISPER_ROOT}";
    const whisper_build = "${WHISPER_BUILD}";
    
    wisprad.addIncludePath(.{ .cwd_relative = whisper_root });
    wisprad.addIncludePath(.{ .cwd_relative = whisper_root ++ "/include" });
    wisprad.addIncludePath(.{ .cwd_relative = whisper_root ++ "/ggml/include" });
    
    // Link to built libraries
    wisprad.addLibraryPath(.{ .cwd_relative = whisper_build ++ "/src" });
    wisprad.addLibraryPath(.{ .cwd_relative = whisper_build ++ "/ggml/src" });
    wisprad.linkSystemLibrary("whisper");
    wisprad.linkSystemLibrary("ggml");
    
    // Install the daemon
    b.installArtifact(wisprad);
    
    // Build wispra-ptt CLI
    const wispra_ptt = b.addExecutable(.{
        .name = "wispra-ptt",
        .root_source_file = b.path("src/cli/wispra_cli.zig"),
        .target = target,
        .optimize = optimize,
    });
    
    // Install the CLI
    b.installArtifact(wispra_ptt);
    
    // Create run step for daemon
    const run_cmd = b.addRunArtifact(wisprad);
    run_cmd.step.dependOn(b.getInstallStep());
    
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    
    const run_step = b.step("run", "Run the daemon");
    run_step.dependOn(&run_cmd.step);
    
    // Create run step for CLI
    const run_cli_cmd = b.addRunArtifact(wispra_ptt);
    run_cli_cmd.step.dependOn(b.getInstallStep());
    
    if (b.args) |args| {
        run_cli_cmd.addArgs(args);
    }
    
    const run_cli_step = b.step("run-cli", "Run the CLI");
    run_cli_step.dependOn(&run_cli_cmd.step);
}
EOF

    print_status "Build configuration updated"
}

# Create default configuration
create_config() {
    print_status "Creating default configuration..."
    
    CONFIG_DIR="$HOME/.config/wispra"
    CONFIG_FILE="$CONFIG_DIR/config.toml"
    
    mkdir -p "$CONFIG_DIR"
    
    if [ ! -f "$CONFIG_FILE" ]; then
        cat > "$CONFIG_FILE" << 'EOF'
[model]
path = "~/.cache/wispra/models/ggml-tiny.en-q5_1.bin"
threads = 4

[output]
mode = "type"

[transcription_log]
enabled = true
path = "~/.local/share/wispra/transcriptions.log"
# auto_cleanup_days = 30  # Uncomment to auto-delete transcriptions older than 30 days

[semantic_correction]
enabled = false
endpoint_url = "https://api.openai.com/v1/chat/completions"
api_key = ""
model = "gpt-4o-mini"
timeout_ms = 15000
EOF
        print_status "Configuration created at $CONFIG_FILE"
    else
        print_status "Configuration already exists at $CONFIG_FILE"
    fi
}

# Build the project
build_project() {
    print_status "Building wispra-zig..."
    
    # Make sure whisper libraries are in library path when building
    export LD_LIBRARY_PATH="$(pwd)/third_party/whisper.cpp/build/src:$(pwd)/third_party/whisper.cpp/build/ggml/src:$LD_LIBRARY_PATH"
    
    zig build
    
    print_status "Build completed successfully"
}

# Install binaries
install_binaries() {
    print_status "Installing binaries..."
    
    mkdir -p ~/.local/bin
    cp zig-out/bin/wisprad ~/.local/bin/
    cp zig-out/bin/wispra-ptt ~/.local/bin/
    
    # Add to PATH if not already there
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    fi
    
    print_status "Binaries installed to ~/.local/bin/"
}

# Setup systemd service
setup_systemd() {
    print_status "Setting up systemd service..."
    
    SERVICE_DIR="$HOME/.config/systemd/user"
    SERVICE_FILE="$SERVICE_DIR/wispra.service"
    
    mkdir -p "$SERVICE_DIR"
    
    # Create service file with proper environment
    cat > "$SERVICE_FILE" << EOF
[Unit]
Description=Wispra Push-to-Talk Daemon (Zig)
After=graphical-session.target

[Service]
Type=simple
ExecStart=$HOME/.local/bin/wisprad --debug
Restart=always
RestartSec=5
Environment="LD_LIBRARY_PATH=$(pwd)/third_party/whisper.cpp/build/src:$(pwd)/third_party/whisper.cpp/build/ggml/src"

[Install]
WantedBy=default.target
EOF
    
    systemctl --user daemon-reload
    print_status "Systemd service created at $SERVICE_FILE"
}

# Main setup function
main() {
    local interactive_mode=""
    
    # Check for interactive flag
    if [[ "$*" == *"--interactive"* ]]; then
        interactive_mode="--interactive"
    fi
    
    print_status "Starting Wispra-Zig setup..."
    
    check_system
    install_dependencies
    setup_whisper
    download_model $interactive_mode
    update_build_config
    create_config
    build_project
    install_binaries
    setup_systemd
    
    print_status "Setup completed successfully!"
    echo
    echo -e "${GREEN}Next steps:${NC}"
    echo "1. Start the service:"
    echo "   systemctl --user enable --now wispra"
    echo
    echo "2. Test the system:"
    echo "   wispra-ptt start"
    echo "   (speak for a few seconds)"
    echo "   wispra-ptt stop"
    echo
    echo "3. Configure Hyprland keybindings in ~/.config/hypr/hyprland.conf:"
    echo "   bind = SUPER, Z, exec, wispra-ptt start"
    echo "   bindrt = SUPER, Z, exec, wispra-ptt stop"
    echo
    echo "4. Optional - Enable semantic correction:"
    echo "   Edit ~/.config/wispra/config.toml"
    echo "   Set enabled = true and add your OpenAI API key"
    echo
    echo -e "${YELLOW}Useful commands:${NC}"
    echo "• View logs: journalctl --user -fu wispra"
    echo "• Check status: systemctl --user status wispra"
    echo "• Test audio devices: wispra-ptt devices"
    echo "• View config: wispra-ptt config --print"
    echo
    echo -e "${GREEN}Setup complete! 🎤${NC}"
}

# Run main function
main "$@"
