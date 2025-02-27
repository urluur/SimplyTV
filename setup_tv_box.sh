#!/bin/bash

PYTHON_SCRIPT="./cec_remote_control.py"
HTML_FILE="$(pwd)/index.html"

echo "Updating and upgrading the system..."
sudo apt-get update && sudo apt-get upgrade -y

echo "Installing Chromium browser..."
sudo apt-get install -y chromium-browser

echo "Installing CEC utilities..."
sudo apt-get install -y cec-utils

echo "Installing Python dependencies..."
sudo apt-get install -y python3-pip
pip3 install pynput

echo "Disabling screen blanking..."
sudo sed -i '/@xscreensaver -no-splash/d' /etc/xdg/lxsession/LXDE-pi/autostart
echo "@xset s off" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@xset -dpms" >> /etc/xdg/lxsession/LXDE-pi/autostart
echo "@xset s noblank" >> /etc/xdg/lxsession/LXDE-pi/autostart

echo "Setting Chromium to launch the local HTML file in kiosk mode on boot..."
echo "@chromium-browser --kiosk file://$HTML_FILE" >> /etc/xdg/lxsession/LXDE-pi/autostart

echo "Making Python script executable..."
chmod +x "$PYTHON_SCRIPT"

echo "Adding Python script to run at startup..."
(crontab -l ; echo "@reboot python3 $PYTHON_SCRIPT &") | crontab -

echo "Setup complete! Rebooting the system..."
sudo reboot
