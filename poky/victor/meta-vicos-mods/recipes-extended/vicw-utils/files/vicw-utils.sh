#!/bin/sh

VOLUME_FILE="/data/vicw-volume"

print_usage() {
    echo "Usage: $0 volume <LEVEL>"
    echo "  LEVEL: MUTE, LOW, MEDIUM, MEDIUM_HIGH, HIGH"
}

is_valid_volume() {
    case "$1" in
        MUTE|LOW|MEDIUM|MEDIUM_HIGH|HIGH)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

if [ $# -ne 2 ]; then
    print_usage
    exit 1
fi

if [ "$1" != "volume" ]; then
    echo "Error: Unknown option '$1'"
    print_usage
    exit 1
fi

if ! is_valid_volume "$2"; then
    echo "Error: Invalid volume level '$2'"
    print_usage
    exit 1
fi

echo "$2" > "$VOLUME_FILE"
/etc/initscripts/anki-audio-init

if [ $? -eq 0 ]; then
    echo "Volume set to: $2"
else
    echo "Error: Failed to write to $VOLUME_FILE"
    exit 1
fi
