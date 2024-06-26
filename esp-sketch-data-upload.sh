#!/bin/bash

# Variables and Options
DATA_FOLDER="./data"
IMAGE_FILE="./filesystem.bin"
BLOCK_SIZE=4096
PAGE_SIZE=256
FILESYSTEM_SIZE=0x100000
CHIP_PORT="/dev/ttyUSB0"
BAUD_RATE=115200
FLASH_ADDRESS=0x110000
FILESYSTEM_TYPE=${1:-littlefs}  # Default to littlefs, can be overridden by first argument
CHIP=${2:-esp8266}  # Default to esp8266, can be overridden by second argument

# Function to create filesystem image
create_filesystem_image() {
  if [ "$FILESYSTEM_TYPE" == "littlefs" ]; then
    if ! command -v mklittlefs &> /dev/null; then
      echo "mklittlefs command not found. Please install it and try again."
      exit 1
    fi
    mklittlefs -c "$DATA_FOLDER" -b "$BLOCK_SIZE" -p "$PAGE_SIZE" -s "$FILESYSTEM_SIZE" "$IMAGE_FILE"
  elif [ "$FILESYSTEM_TYPE" == "spiffs" ]; then
    if ! command -v mkspiffs &> /dev/null; then
      echo "mkspiffs command not found. Please install it and try again."
      exit 1
    fi
    mkspiffs -c "$DATA_FOLDER" -b "$BLOCK_SIZE" -p "$PAGE_SIZE" -s "$FILESYSTEM_SIZE" "$IMAGE_FILE"
  else
    echo "Unsupported filesystem type: $FILESYSTEM_TYPE"
    exit 1
  fi
}

# Function to upload filesystem image
upload_filesystem_image() {
  if ! command -v esptool.py &> /dev/null; then
    echo "esptool.py command not found. Please install it and try again."
    exit 1
  fi
  esptool.py --chip "$CHIP" --port "$CHIP_PORT" --baud "$BAUD_RATE" write_flash -z "$FLASH_ADDRESS" "$IMAGE_FILE"
}

# Step 1: Generate filesystem image
create_filesystem_image

# Check if the filesystem image was created successfully
if [ ! -f "$IMAGE_FILE" ]; then
  echo "Failed to create $FILESYSTEM_TYPE image"
  exit 1
fi

# Step 2: Upload filesystem image
upload_filesystem_image

# Check if the upload was successful
if [ $? -ne 0 ]; then
  echo "Failed to upload $FILESYSTEM_TYPE image"
  exit 1
fi

echo "$FILESYSTEM_TYPE image successfully uploaded to $CHIP"
