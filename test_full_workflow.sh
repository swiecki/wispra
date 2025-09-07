#!/bin/bash

echo "=== Testing Full Omawisp Transcription Workflow ==="

# Start daemon in background
./zig-out/bin/omawispd --debug &
DAEMON_PID=$!

# Give daemon time to start
sleep 2

echo "1. Testing daemon status..."
./zig-out/bin/omawisp-ptt status

echo -e "\n2. Testing device listing..."
./zig-out/bin/omawisp-ptt devices

echo -e "\n3. Testing transcription workflow..."
echo "Starting audio capture..."
./zig-out/bin/omawisp-ptt start

echo "Speak now for 3 seconds..."
sleep 3

echo "Stopping and transcribing..."
RESULT=$(./zig-out/bin/omawisp-ptt stop)
echo "Transcription result: $RESULT"

echo -e "\n4. Testing semantic correction (if enabled)..."
echo "Check if result was semantically corrected"

# Clean up
kill $DAEMON_PID
echo -e "\nTest complete!"
