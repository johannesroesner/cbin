#!/bin/bash
OUTPUT=$(sudo openfortivpn -c ~/.openfortivpn/config 2>&1)
TRUSTED_CERT=$(echo "$OUTPUT" | grep 'trusted-cert' | grep -o '[a-f0-9]\{64\}' | head -n 1)
sudo openfortivpn -c ~/.openfortivpn/config --trusted-cert $TRUSTED_CERT