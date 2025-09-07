# Wispra-Zig: Push-to-Talk Transcription

A fast, local speech-to-text system with semantic correction capabilities, written in Zig.

## Features

- 🎤 **Local transcription** using Whisper.cpp (no cloud dependencies)
- ⚡ **Push-to-talk interface** with keyboard shortcuts
- 🧠 **Semantic correction** via OpenAI API (optional)
- ⌨️  **Multiple output modes**: direct typing, clipboard, or stdout
- 🔧 **Easy setup** with automated dependency management
- 🔒 **Privacy-focused** - audio never leaves your machine (unless semantic correction is enabled)

## Quick Setup

### Automated Installation

The easiest way to get started:

```bash
# Clone the repository
git clone <repository-url>
cd wispra-zig

# Run the setup script (will install dependencies and build everything)
./setup.sh

# For interactive model selection:
./setup.sh --interactive
```

The setup script will:
1. Install system dependencies (Zig, PortAudio, etc.)
2. Build Whisper.cpp from source
3. Download a Whisper model (tiny/base/small)
4. Build and install the binaries
5. Create systemd service
6. Set up default configuration

### Manual Setup

If you prefer manual installation:

<details>
<summary>Click to expand manual setup instructions</summary>

#### Dependencies

**Arch Linux:**
```bash
sudo pacman -S zig portaudio cmake make gcc git curl wtype wl-clipboard
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install -y build-essential cmake git curl portaudio19-dev wtype wl-clipboard-tools
# Install Zig 0.14.1+ manually from https://ziglang.org/download/
```

**Fedora:**
```bash
sudo dnf install -y cmake make gcc-c++ git curl portaudio-devel wtype wl-clipboard
# Install Zig 0.14.1+ manually from https://ziglang.org/download/
```

#### Build Whisper.cpp

```bash
mkdir -p third_party
git clone https://github.com/ggerganov/whisper.cpp.git third_party/whisper.cpp
cd third_party/whisper.cpp
mkdir build && cd build
cmake .. && make -j$(nproc)
cd ../../..
```

#### Download Models

Choose a model based on your speed/accuracy needs:

```bash
mkdir -p ~/.cache/wispra/models
cd ~/.cache/wispra/models

# Tiny model (fastest, 39MB)
curl -LO "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-tiny.en-q5_1.bin"

# Base model (balanced, 57MB)
curl -LO "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en-q5_1.bin"

# Small model (best quality, 244MB)
curl -LO "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.en-q5_1.bin"
```

#### Build and Install

```bash
# Build the project
zig build

# Install binaries
mkdir -p ~/.local/bin
cp zig-out/bin/wisprad ~/.local/bin/
cp zig-out/bin/wispra-ptt ~/.local/bin/

# Add to PATH if needed
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
```

</details>

## Configuration

### Basic Configuration

Configuration file: `~/.config/wispra/config.toml`

```toml
[model]
path = "~/.cache/wispra/models/ggml-tiny.en-q5_1.bin"
threads = 4

[output]
mode = "type"  # type|clipboard|stdout

[semantic_correction]
enabled = false
endpoint_url = "https://api.openai.com/v1/chat/completions"
api_key = ""
model = "gpt-4o-mini"
timeout_ms = 15000
```

### Model Selection

| Model | Size | Speed | Accuracy | Use Case |
|-------|------|-------|----------|----------|
| `tiny` | 39MB | Fastest | Good | Quick notes, commands |
| `base` | 57MB | Fast | Better | General use |
| `small` | 244MB | Slower | Best | High accuracy needs |

### Output Modes

- **`type`**: Directly types text using `wtype` (recommended for most use cases)
- **`clipboard`**: Copies to clipboard and auto-pastes with Ctrl+V
- **`stdout`**: Prints to terminal (useful for debugging)

### Semantic Correction (Optional)

Enable AI-powered text correction for better grammar and clarity:

1. Get an OpenAI API key from https://platform.openai.com/
2. Edit `~/.config/wispra/config.toml`:
   ```toml
   [semantic_correction]
   enabled = true
   api_key = "sk-your-api-key-here"
   ```

## Usage

### Starting the Service

```bash
# Enable and start the systemd service
systemctl --user enable --now wispra

# Check status
systemctl --user status wispra

# View logs
journalctl --user -fu wispra
```

### Push-to-Talk Commands

```bash
# Start recording
wispra-ptt start

# Stop recording (this triggers transcription)
wispra-ptt stop

# Check daemon status
wispra-ptt status

# List available audio devices
wispra-ptt devices

# View current configuration
wispra-ptt config --print
```

### Keyboard Shortcuts (Hyprland)

Add to `~/.config/hypr/hyprland.conf`:

```ini
# Push-to-talk with Super+Z
bind = SUPER, Z, exec, wispra-ptt start
bindrt = SUPER, Z, exec, wispra-ptt stop
```

For other window managers, set up similar key bindings to run these commands.

## Troubleshooting

### Common Issues

**"Model not found" error:**
```bash
# Check if model exists
ls ~/.cache/wispra/models/

# Re-download if missing
curl -LO "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-tiny.en-q5_1.bin"
```

**"Library not found" errors:**
```bash
# Check if whisper libraries exist
ls third_party/whisper.cpp/build/src/
ls third_party/whisper.cpp/build/ggml/src/

# Rebuild whisper.cpp if missing
cd third_party/whisper.cpp/build && make -j$(nproc)
```

**Audio device issues:**
```bash
# List available devices
wispra-ptt devices

# Test with specific device (edit config)
# Change device = "default" to your preferred device
```

**Semantic correction timeouts:**
```bash
# Test API key manually
curl -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"model":"gpt-4o-mini","messages":[{"role":"user","content":"test"}]}' \
     https://api.openai.com/v1/chat/completions
```

### Debug Mode

Run the daemon manually for debugging:

```bash
# Stop the service first
systemctl --user stop wispra

# Run with debug output
wisprad --debug

# In another terminal, test with
wispra-ptt start
# (speak)
wispra-ptt stop
```

### Logs

```bash
# View recent logs
journalctl --user -u wispra -n 50

# Follow logs in real-time
journalctl --user -fu wispra

# Filter for errors only
journalctl --user -u wispra -p err
```

## Performance Tips

- **For faster transcription**: Use the `tiny` model and reduce `threads` in config
- **For better accuracy**: Use the `small` model and increase `threads` (up to your CPU cores)
- **For semantic correction**: Consider using `gpt-4o-mini` for speed or `gpt-4` for quality

## Architecture

- **`wisprad`**: Main daemon that handles audio capture and transcription
- **`wispra-ptt`**: CLI client for controlling the daemon
- **Audio Pipeline**: PortAudio → Ring Buffer → Whisper.cpp → Output
- **IPC**: Unix domain sockets for client-daemon communication
- **Models**: Local Whisper GGML models for offline transcription

## Development

```bash
# Build in development mode
zig build

# Run tests
zig test src/test.zig

# Format code
zig fmt src/

# Clean build artifacts
rm -rf zig-cache zig-out
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

[Add your license here]

## Acknowledgments

- [whisper.cpp](https://github.com/ggerganov/whisper.cpp) for the fast Whisper implementation
- [OpenAI](https://openai.com) for the Whisper model and GPT API
- [PortAudio](http://portaudio.com/) for cross-platform audio I/O
