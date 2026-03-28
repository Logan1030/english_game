#!/bin/bash
# Build Flutter APK with timestamp naming
# Usage: ./build_with_timestamp.sh [debug|release]

set -e

BUILD_TYPE=${1:-debug}
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_DIR="build/app/outputs/flutter-apk"

echo "Building Flutter $BUILD_TYPE APK..."
flutter build apk --$BUILD_TYPE

# Find the APK file
APK_FILE="$OUTPUT_DIR/app-$BUILD_TYPE.apk"

if [ -f "$APK_FILE" ]; then
    # Create timestamped filename
    TIMESTAMPED_APK="$OUTPUT_DIR/app-${BUILD_TYPE}_${TIMESTAMP}.apk"

    # Copy with new name (keep original)
    cp "$APK_FILE" "$TIMESTAMPED_APK"

    echo "Original APK: $APK_FILE"
    echo "Timestamped APK: $TIMESTAMPED_APK"
    echo "Done!"
else
    echo "Error: APK file not found at $APK_FILE"
    exit 1
fi
