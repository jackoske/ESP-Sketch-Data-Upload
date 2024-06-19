# ESP32 SPIFFS Upload Script

This script is used to generate a SPIFFS image from a data folder and upload it to an ESP32 chip.

## Variables and Options

- `DATA_FOLDER`: The directory containing the data to be included in the SPIFFS image.
- `PYTHON_CMD`: The command to run Python. Adjust as per your Python installation.
- `IMAGE_FILE`: The output file for the SPIFFS image.
- `CHIP`: The type of chip. This is taken from the first command-line argument, with a default value of 'esp32'.
- `BLOCK_SIZE`: The block size for the SPIFFS image.
- `PAGE_SIZE`: The page size for the SPIFFS image.
- `SPIFFS_SIZE`: The size of the SPIFFS image.
- `CHIP_PORT`: The port that the chip is connected to.
- `BAUD_RATE`: The baud rate for the upload.
- `FLASH_ADDRESS`: The address to write the SPIFFS image to.

## Usage

Run the script with the chip type as the first argument. If no argument is provided, the chip type defaults to 'esp32'.

```shell
./esp-sketch-data-upload.sh <chip_type>

## Dependencies

This script relies on the following tools:

- [**mkspiffs**](https://github.com/igrr/mkspiffs): This tool is used to create a SPIFFS image from the data folder.
- [**esptool**](https://github.com/espressif/esptool): This tool is used to upload the SPIFFS image to the ESP32 chip.

Please ensure these tools are installed and available in your system's PATH before running the script.

replacement for
`Tools -> ESP8266 Sketch Data Upload`.
