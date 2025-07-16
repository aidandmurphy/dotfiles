# ~/.local/bin/bluetooth-launcher.sh
#!/bin/bash


# add the following line to allow the script to start the Bluetooth daemon without a password:
# sudo visudo
# yourusername ALL=NOPASSWD: /bin/systemctl start bluetooth.service


# Check if bluetooth service is running
if ! systemctl is-active --quiet bluetooth.service; then
    sudo systemctl start bluetooth.service
fi

# Launch the Bluetooth GUI
blueman-manager &
blueman-applet &
