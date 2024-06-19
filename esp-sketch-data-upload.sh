#!/bin/bash

# Variables and Options
DATA_FOLDER="./data"
PYTHON_CMD="python3"  # Adjust as per your Python installation
IMAGE_FILE="./spiffs.bin"
CHIP=${1:-esp32}  # Get the first command-line argument, default to 'esp32'
BLOCK_SIZE=4096
PAGE_SIZE=256
SPIFFS_SIZE=0x100000
CHIP_PORT="/dev/ttyUSB0"
BAUD_RATE=115200
FLASH_ADDRESS=0x110000

# Step 1: Generate SPIFFS image
mkspiffs -c $DATA_FOLDER -b $BLOCK_SIZE -p $PAGE_SIZE -s $SPIFFS_SIZE $IMAGE_FILE

# Step 2: Upload SPIFFS image
esptool.py --chip $CHIP --port $CHIP_PORT --baud $BAUD_RATE write_flash -z $FLASH_ADDRESS $IMAGE_FILE