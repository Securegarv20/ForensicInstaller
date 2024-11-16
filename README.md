# ForensicInstaller

## Description

**ForensicInstaller** is a simple Bash script designed to automate the installation of essential digital forensics tools for Kali Linux. It was created to help students in the Digital Forensics lab easily install and configure various forensics tools required for coursework. The script ensures all necessary tools are installed with minimal effort, reducing setup time for students.

This tool checks for the installation of the tools, and if they are not already installed, it automatically installs them. The installation process is logged, making it easy to troubleshoot any issues that arise.

## Tools Installed

The following tools are installed using this script:

- **Autopsy**: A graphical interface to The Sleuth Kit for analyzing disk images.
- **Wireshark**: A network protocol analyzer for network troubleshooting, analysis, and software development.
- **ExifTool**: A tool for reading, writing, and editing meta information in files.
- **SleuthKit**: Tools for forensic analysis of volumes and filesystems.
- **Volatility**: A memory forensics framework for analyzing RAM dumps.
- **Hashdeep**: A tool for recursive hashing of files.
- **OSQuery**: SQL-powered operating system instrumentation, monitoring, and analytics.
- **Guymager**: A forensic imager for media acquisition.
- **Regripper**: A tool for extracting information from Windows registry hives.
- **GRR (Google Rapid Response)**: A tool for remote live forensics and incident response.

## Features

- Installs all the above tools automatically on Kali Linux.
- Checks if each tool is already installed and skips installation if present.
- Logs the installation process to `install_tools.log`.
- Ensures that all tools are ready for use in the Digital Forensics lab.

## Usage

1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/ForensicInstaller.git
    ```

2. Navigate to the project directory:
    ```bash
    cd ForensicInstaller
    ```

3. Make the script executable:
    ```bash
    chmod +x ForensicInstaller.sh
    ```

4. Run the script with root privileges:
    ```bash
    sudo ./ForensicInstaller.sh
    ```

The script will automatically update the system and install all the required tools. It will log each step to `install_tools.log` for later review.

## Requirements

- Kali Linux
- Root (sudo) privileges

## Log File

All installation steps are logged to a file named `install_tools.log`. You can check this file for any errors or details about the installation process.

## Author

- **Author**: SecureGarv
- **GitHub**: [SecureGarv20](https://github.com/Securegarv20)

## License

This project is open-source and available under the [MIT License](LICENSE).
