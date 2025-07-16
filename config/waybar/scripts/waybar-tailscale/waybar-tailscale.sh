#!/bin/bash 

# add the following line to allow the script to start the Tailscale daemon without a password:
# sudo visudo
# yourusername ALL=NOPASSWD: /bin/systemctl start tailscaled.service

STATUS_KEY="BackendState"
RUNNING="Running"

start_daemon_if_needed () {
    if ! systemctl is-active --quiet tailscaled.service; then
        notify-send -i network-vpn "Tailscale" "Starting tailscaled daemon..."
        sudo systemctl start tailscaled.service
        # Wait up to 5 seconds for the daemon to be active
        for i in {1..5}; do
            if systemctl is-active --quiet tailscaled.service; then
                return 0  # started
            fi
            sleep 1
        done
        return 0  # started, but may still be initializing
    fi
    return 1  # already running
}

tailscale_status () {
    status="$(tailscale status --json 2>/dev/null | jq -r '.'$STATUS_KEY)"
    if [ "$status" = "$RUNNING" ]; then
        return 0
    fi
    return 1
}

toggle_status () {
    start_daemon_if_needed
    started_daemon=$?

    # If we just started the daemon, give it a moment to initialize Tailscale (not just the service)
    if [ "$started_daemon" -eq 0 ]; then
        for i in {1..5}; do
            if tailscale_status; then
                break
            fi
            sleep 1
        done
    fi

    if tailscale_status; then
        notify-send -i network-vpn "Tailscale" "Disconnecting..."
        if sudo tailscale down; then
            notify-send -i network-vpn "Tailscale" "Tailscale is now off."
        else
            notify-send -u critical -i dialog-error "Tailscale Error" "Failed to turn off Tailscale."
        fi
    else
        notify-send -i network-vpn "Tailscale" "Connecting..."
        if timeout 10 sudo tailscale up; then
            notify-send -i network-vpn -t 3000 "Tailscale" "Tailscale is now connected."
        else
            notify-send -u critical -i dialog-error "Tailscale Error" "Failed to start Tailscale. Connection timeout."
        fi
    fi
}

case $1 in
    --status)
        if tailscale_status; then
            T=${2:-"green"}
            F=${3:-"red"}
            peers=$(tailscale status --json | jq -r --arg T "'$T'" --arg F "'$F'" \
                '.Peer[] | ("<span color=" + (if .Online then $T else $F end) + ">" + (.DNSName | split(".")[0]) + "</span>")' | tr '\n' '\r')
            exitnode=$(tailscale status --json | jq -r '.Peer[] | select(.ExitNode == true).DNSName | split(".")[0]')
            echo "{\"text\":\"${exitnode}\",\"class\":\"connected\",\"alt\":\"connected\", \"tooltip\": \"${peers}\"}"
        else
            echo "{\"text\":\"\",\"class\":\"stopped\",\"alt\":\"stopped\", \"tooltip\": \"The VPN is not active.\"}"
        fi
    ;;
    --toggle)
        toggle_status
    ;;
    *)
        echo "Usage: $0 --status | --toggle"
        exit 1
    ;;
esac