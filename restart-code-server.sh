#!/bin/bash

# 1. Identify the port and current PID
PORT=13337 # Default for most Coder templates; change if yours uses 8080
OLD_PID=$(pgrep -f "code-server.*--port $PORT")

if [ -z "$OLD_PID" ]; then
    echo "⚠️ No code-server found on port $PORT. Attempting to start fresh..."
else
    echo "Stopping existing code-server (PID: $OLD_PID)..."
    kill $OLD_PID
    # Wait for the port to clear
    sleep 2
fi

# 2. Define the persistence flags
FLAGS="--auth none --port $PORT --reconnection-grace-time 28800"

echo "🚀 Starting code-server with persistence flags..."

# 3. Launch in background
# Use nohup so it doesn't die when you close THIS terminal
nohup code-server $FLAGS >/tmp/code-server.log 2>&1 &

echo "✅ Success! Refresh your browser or reconnect VS Code."
echo "Check /tmp/code-server.log if it fails to load."