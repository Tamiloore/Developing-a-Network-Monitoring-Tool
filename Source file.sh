#!/bin/bash

# List of nodes to ping
nodes=("google.com" "8.8.8.8" "192.168.1.3" "example.com")

# Loop through each node and ping
for node in "${nodes[@]}"; do
    echo "Pinging $node..."
    ping -s 4 "$node" 
    if ping -c 4 "$node" &> /dev/null; then
        echo "Node $node is up."
        log_ping_result "$node" "UP"
    else
        echo "Node $node is down."
        log_ping_result "$node" "DOWN"
    fi
    echo "====================="
done

# File to log ping results
log_file="ping_log.txt"


# Function to log ping results
log_ping_result() {
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$timestamp - $1: $2" >> "$log_file"
}

    