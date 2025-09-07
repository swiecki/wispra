# OmaWisp (CPU-only, low-latency push-to-talk for Hyprland)

A CPU-only push-to-talk transcription daemon and CLI for Arch Linux + Hyprland (Wayland), powered by PipeWire, WebRTC VAD, and whisper.cpp. Designed for very low latency on modern 12-core CPUs.

## Features
- Super+Z push-to-talk via Hyprland keybinds (no global grabs).
- PipeWire native capture at 16 kHz mono, 10 ms frames (ALSA fallback).
- 300 ms pre-roll ring buffer to avoid clipped onsets.
- WebRTC VAD for trimming and finalization assistance.
- whisper.cpp tiny.en by default, English-only, low beam size.
- Live partials (debug logs) and fast final pass on key-up.
- Output modes: type into focused window (hyprctl or wtype), clipboard, or stdout.
- UNIX socket IPC between CLI (`omawisp-ptt`) and daemon (`omawispd`).
- Optional external cleanup (OpenAI-compatible HTTP), disabled by default.
- Systemd --user service and sample Hyprland binds.

## Install (Arch)
```
# Dependencies and third-party sources
./scripts/install.sh

# Build
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)

# Install binaries into ~/.local/bin
mkdir -p ~/.local/bin
cp omawispd omawisp-ptt ~/.local/bin/
```

## Systemd user service
```
mkdir -p ~/.config/systemd/user
cp scripts/omawisp.service ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now omawisp.service
```

## Hyprland keybinds
```
bind = SUPER, Z, exec, omawisp-ptt start
bindr = SUPER, Z, exec, omawisp-ptt stop
```
If `bindr` is unavailable, fall back to a toggle (see `scripts/sample-hyprland.conf`).

## Configuration
Config file: `~/.config/omawisp/config.toml`

```
[model]
path = "~/.cache/omawisp/models/ggml-tiny.en-q5_1.bin"
threads = 10
english_only = true
beam_size = 2

[audio]
backend = "pipewire"
device = "default"
sample_rate = 16000
frame_ms = 10
preroll_ms = 300

[vad]
enabled = true
aggressiveness = 2
min_speech_ms = 150
max_silence_ms = 300

[output]
mode = "type" # type|clipboard|stdout
use_hyprctl = true
use_wtype_fallback = true

[cleanup]
enabled = false
endpoint_url = ""
api_key = ""
timeout_ms = 1500
```
Print your effective config:
```
omawisp-ptt config --print
```

## CLI
```
omawisp-ptt start   # begin capture/streaming immediately
omawisp-ptt stop    # finalize and output text
omawisp-ptt status  # show state + metrics
```

## Notes
- For best latency: set `PIPEWIRE_LATENCY=256/48000` in the environment (service file includes this).
- Default model is tiny.en; you can switch to base.en in config. Download model files separately and point `model.path` to them.
- LLM cleanup is optional and off by default; when enabled, the daemon will POST the final transcript to the endpoint and paste the returned `choices[0].message.content`.

## Dependencies
Arch packages: `base-devel cmake pipewire libpipewire alsa-lib wl-clipboard wtype rtkit`.

## Status
This repository includes a full buildable skeleton. `scripts/install.sh` fetches `whisper.cpp` and WebRTC VAD sources to enable real decoding. The daemon targets TTFF ≤ 300 ms and finalization ≤ 1200 ms on a 12-core CPU with `tiny.en`.
