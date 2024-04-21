#!/bin/bash

# Configuration (Edit these if needed)
ENDPOINT_URL="http://127.0.0.1:8000/v1/openvpn/portforwarded"

# Ensure environment variables are set
if [[ -z "$DELUGE_USER" || -z "$DELUGE_PASSWORD" ]]; then
  echo "Error: DELUGE_USER and PASSWORD environment variables must be set."
  exit 1
fi

# Function to update Deluge port
update_deluge_port() {
  sleep 30
  current_port=0 

  while true; do
    # Fetch the port number
    response=$(wget -qO - "$ENDPOINT_URL")
    new_port=$(echo "$response" | grep -oE "[0-9]+" )

    if [[ -n "$new_port" && "$new_port" != "$current_port" ]]; then
      # Launch Deluge console with the updated port
      deluge-console "connect 127.0.0.1:58846 $DELUGE_USER $DELUGE_PASSWORD; config -s random_port false; config -s listen_ports ($new_port, $new_port)" &

      # Update the current port
      current_port=$new_port

      # Echo the updated port
      echo "Updated Deluge port to $new_port"
    fi

    sleep 90
  done
}

echo "Running deluge port sync infinite loop"
# Call the function and fork it into the background
update_deluge_port & 

