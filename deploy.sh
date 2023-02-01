#!/bin/bash

# Clone the Git repository
git clone https://github.com/SpurthiM16/Demo.git

# Change to the repository directory
cd Demo

# Copy the Welcome.sh script to the desired location
cp Welcome.sh /usr/local/bin/

# Make the Welcome.sh script executable
chmod +x /usr/local/bin/Welcome.sh

# Copy the index.html file to the desired location
cp index.html /var/www/html/

# Restart the web server to reflect the changes
systemctl restart apache2
