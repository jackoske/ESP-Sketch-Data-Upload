#!/bin/bash

# Variables and Options
DATA_FOLDER="./data"
IMAGE_FILE="./spiffs.bin"
CHIP="esp8266"  # ESP8266 for the chip type
BLOCK_SIZE=4096
PAGE_SIZE=256
SPIFFS_SIZE=0x100000
CHIP_PORT="/dev/ttyUSB0"
BAUD_RATE=115200
FLASH_ADDRESS=0x110000

# Step 1: Generate SPIFFS image
mkspiffs -c $DATA_FOLDER -b $BLOCK_SIZE -p $PAGE_SIZE -s $SPIFFS_SIZE $IMAGE_FILE

# Check if the SPIFFS image was created successfully
if [ ! -f $IMAGE_FILE ]; then
  echo "Failed to create SPIFFS image"
  exit 1
fi

# Step 2: Upload SPIFFS image
esptool.py --chip $CHIP --port $CHIP_PORT --baud $BAUD_RATE write_flash -z $FLASH_ADDRESS $IMAGE_FILE

# Check if the upload was successful
if [ $? -ne 0 ]; then
  echo "Failed to upload SPIFFS image"
  exit 1
fi

echo "SPIFFS image successfully uploaded"

