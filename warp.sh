#!/bin/bash

# Check if warp-cli is installed
if ! command -v warp-cli &>/dev/null; then
    echo "warp-cli is not installed. Please install it first by using command 'warp-cli install' "
    exit 1
fi

# Check WARP connection status
status=$(warp-cli status)

if [[ "$status" == *"Connected"* ]]; then
    echo "WARP is already connected."
else
    echo "WARP is not connected. Connecting now..."
    warp-cli connect
fi

# Check WARP connection status in a loop
while true; do
    status=$(warp-cli status)

    if [[ "$status" == *"Connected"* ]]; then
        echo "WARP is connected."
        break
    else
        echo "WARP is not connected yet. Checking again"
    fi

    sleep 1
done
