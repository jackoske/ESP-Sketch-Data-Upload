Apologies for the oversight. Let's update the script and the README to include the ability to specify both the filesystem type and the chip type. Here’s the revised README and script:

## README

# ESP8266/ESP32 Filesystem Upload Script

This script is used to generate a filesystem image (SPIFFS or LittleFS) from a data folder and upload it to an ESP8266 or ESP32 chip.

Uploading files to the ESP modules, such as HTML, CSS, JavaScript, and other resources, involves using a feature called SPIFFS (SPI Flash File System) or LittleFS. These filesystems allow you to store and serve files directly from the module's Flash memory, eliminating the need for an external SD card. Here's a script to upload files to ESP devices.

## Variables and Options

- `DATA_FOLDER`: The directory containing the data to be included in the filesystem image.
- `IMAGE_FILE`: The output file for the filesystem image.
- `CHIP`: The type of chip. Default value is 'esp8266'.
- `BLOCK_SIZE`: The block size for the filesystem image.
- `PAGE_SIZE`: The page size for the filesystem image.
- `FILESYSTEM_SIZE`: The size of the filesystem image.
- `CHIP_PORT`: The port that the chip is connected to.
- `BAUD_RATE`: The baud rate for the upload.
- `FLASH_ADDRESS`: The address to write the filesystem image to.
- `FILESYSTEM_TYPE`: The type of filesystem to use (`littlefs` or `spiffs`). Default is `littlefs`.

## Usage

Before running the script, you need to place all the files you want to include in the filesystem image in a folder named `data`. This folder should be in the same directory as the script. The script will take all the files in the `data` folder and include them in the filesystem image.

The `data` folder can include any type of file, such as HTML, CSS, JavaScript, images, and other resources. The files in the `data` folder will be accessible from your ESP8266/ESP32 program using the SPIFFS or LittleFS APIs.

*Please note that the total size of the files in the `data` folder should not exceed the `FILESYSTEM_SIZE` specified in the script.*

Run the script with the filesystem type as the first argument and the chip type as the second argument. If no arguments are provided, the filesystem type defaults to 'littlefs' and the chip type defaults to 'esp8266'.

```bash
./esp-filesystem-upload.sh <filesystem_type> <chip_type>
```

Example usage:

```bash
# For LittleFS and ESP8266 (default)
./esp-filesystem-upload.sh

# For SPIFFS and ESP8266
./esp-filesystem-upload.sh spiffs

# For LittleFS and ESP32
./esp-filesystem-upload.sh littlefs esp32

# For SPIFFS and ESP32
./esp-filesystem-upload.sh spiffs esp32
```

## Dependencies

This script relies on the following tools:

- [**mklittlefs**](https://github.com/earlephilhower/mklittlefs): This tool is used to create a LittleFS image from the data folder.
- [**mkspiffs**](https://github.com/igrr/mkspiffs): This tool is used to create a SPIFFS image from the data folder.
- [**esptool**](https://github.com/espressif/esptool): This tool is used to upload the filesystem image to the ESP8266/ESP32 chip.

Please ensure these tools are installed and available in your system's PATH before running the script.
