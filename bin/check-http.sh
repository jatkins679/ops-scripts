#!/usr/bin/env bash

# Name: check-http.sh
# Description: Repeatedly check an HTTP/HTTPS endpoint, display response
#              headers, and report status, redirects, IP address, and timing.
# Tags: network,http,https,curl,monitoring,troubleshooting,noc
# Usage: ./check-http.sh [URL]
# Platform: Linux, macOS
# Requires: bash, curl
# Updated: 2026-09-03

# Make sure curl is installed.
if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is not installed or not in PATH."
    exit 1
fi

# Use a URL supplied on the command line, if present.
URL="${1:-}"

# Otherwise ask the user for one.
if [[ -z "$URL" ]]; then
    read -r -p "URL to check: " URL
fi

# Ask how many checks to perform.
read -r -p "Number of attempts [5]: " attempts
attempts="${attempts:-5}"

# Ask how long to wait between checks.
read -r -p "Seconds between attempts [2]: " delay
delay="${delay:-2}"

# Validate the number of attempts.
if ! [[ "$attempts" =~ ^[0-9]+$ ]] || [[ "$attempts" -lt 1 ]]; then
    echo "Error: attempts must be a positive whole number."
    exit 1
fi

# Validate the delay.
if ! [[ "$delay" =~ ^[0-9]+$ ]]; then
    echo "Error: delay must be zero or a positive whole number."
    exit 1
fi

for ((i=1; i<=attempts; i++)); do

    echo
    echo "========================================"
    echo "Attempt $i of $attempts"
    echo "Target: $URL"
    echo "========================================"

    curl -sS -L \
        -D - \
        -o /dev/null \
        -w '\nSummary:\n  HTTP status: %{http_code}\n  Final URL: %{url_effective}\n  Remote IP: %{remote_ip}\n  Redirects: %{num_redirects}\n  Connect time: %{time_connect}s\n  Total time: %{time_total}s\n' \
        "$URL"

    curl_status=$?

    if [[ "$curl_status" -ne 0 ]]; then
        echo
        echo "curl exited with code $curl_status"
    fi

    if [[ "$i" -lt "$attempts" ]]; then
        echo
        echo "Waiting $delay seconds..."
        sleep "$delay"
    fi

done
