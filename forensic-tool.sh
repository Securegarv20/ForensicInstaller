#!/bin/bash

# Tool: ForensicInstaller
# Author: securegarv


LOGFILE="install_tools.log"

log_message() {
    echo "$(date): $1" | tee -a $LOGFILE
}

install_package() {
    local package=$1
    if dpkg -l | grep -qw $package; then
        log_message "$package is already installed."
    else
        echo -n "Installing $package... "
        if apt-get -qq install -y $package; then
            echo "done."
            log_message "Installed $package."
        else
            echo "failed."
            log_message "Error installing $package."
        fi
    fi
}

echo "
░▒▓████████▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░ ░▒▓████████▓▒░░▒▓███████▓▒░  ░▒▓███████▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░       ░▒▓████████▓▒░░▒▓██████▓▒░  ░▒▓██████▓▒░ ░▒▓█▓▒░        
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░         ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░        
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░                ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░        
░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓███████▓▒░ ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░                ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░        
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░                ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░        
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░         ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░        
░▒▓█▓▒░       ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓████████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓███████▓▒░ ░▒▓█▓▒░ ░▒▓██████▓▒░          ░▒▓█▓▒░    ░▒▓██████▓▒░  ░▒▓██████▓▒░ ░▒▓████████▓▒░ 
                                                                                                                                                                      
                                                                                                                                                                      
"

log_message "Updating and upgrading system..."
echo "#############################"
if apt-get update -y && apt-get upgrade -y; then
    echo "System update and upgrade done."
    echo "#############################"
else
    echo "Error during update and upgrade."
    echo "#############################"
    exit 1
fi

# List of digital forensics and related tools for Kali Linux
tools=(
    autopsy           # A graphical interface to The Sleuth Kit for analyzing disk images.
    wireshark         # A network protocol analyzer for network troubleshooting, analysis, and software development.
    exiftool          # A tool for reading, writing, and editing meta information in files.
    sleuthkit         # Tools for forensic analysis of volumes and filesystems.
    volatility        # A memory forensics framework for analyzing RAM dumps.
    hashdeep          # A tool for recursive hashing of files.
    osquery           # SQL-powered operating system instrumentation, monitoring, and analytics.
    guymager          # A forensic imager for media acquisition.
    regripper         # A tool for extracting information from Windows registry hives.
    grr               # Rapid Response: remote live forensics and incident response.
)

for tool in "${tools[@]}"; do
    echo "#############################"
    echo -n "Checking $tool... "
    install_package $tool
done

echo "#############################"
echo "All installations complete."
