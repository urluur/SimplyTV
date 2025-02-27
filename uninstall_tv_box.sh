#!/bin/bash

# Define the Python Script Path
PYTHON_SCRIPT="./cec_remote_control.py"

# Remove the Python Script from Crontab
echo "Removing the Python script from startup..."
crontab -l | grep -v "@reboot python3 $PYTHON_SCRIPT &" | crontab -

# Restore Default Screen Blanking Settings
echo "Restoring screen blanking settings..."
sudo sed -i '/@xset s off/d' /etc/xdg/lxsession/LXDE-pi/autostart
sudo sed -i '/@xset -dpms/d' /etc/xdg/lxsession/LXDE-pi/autostart
sudo sed -i '/@xset s noblank/d' /etc/xdg/lxsession/LXDE-pi/autostart

# Remove Chromium Kiosk Mode from Autostart
echo "Removing Chromium kiosk mode from startup..."
sudo sed -i '/@chromium-browser --kiosk/d' /etc/xdg/lxsession/LXDE-pi/autostart

echo "Uninstallation complete. You may need to reboot."
