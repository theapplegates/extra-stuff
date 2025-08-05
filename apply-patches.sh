#!/bin/bash

PATCH_DIR="./patches"  # Change this to your patch folder path

# Apply each patch file in the folder
for patch_file in "$PATCH_DIR"/*.patch; do
  [ -e "$patch_file" ] || continue  # Skip if no .patch files found
  echo "Applying patch: $patch_file"
  patch -p1 < "$patch_file" || {
    echo "❌ Failed to apply patch: $patch_file"
    exit 1
  }
done

echo "✅ All patches applied."
