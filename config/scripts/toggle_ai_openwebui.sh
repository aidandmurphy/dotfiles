#!/bin/bash
sudo echo "Running..."
if pgrep ollama > /dev/null
then
    echo "Stopping ollama and open-webui" & pkill ollama & sudo systemctl stop open-webui.service
else
    echo "Starting ollama and open-webui" & exec /usr/bin/ollama serve & sudo systemctl start open-webui.service
fi
