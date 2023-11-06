#!/bin/bash
echo "file version 1.0)"
echo "Computer Information (Linux)"
echo "----------------------------"
echo "Hostname: $(hostname)"
echo "Operating System: $(cat /etc/os-release | grep 'PRETTY_NAME' | cut -d'"' -f 2)"
echo "Kernel Version: $(uname -r)"
echo "CPU Model: $(lscpu | grep 'Model name' | cut -d':' -f 2 | tr -s ' ')"
echo "Total RAM: $(free -h | grep 'Mem:' | awk '{print $2}')"
echo "----------------------------"
