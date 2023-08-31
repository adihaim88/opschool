#!/bin/bash

# Check if at least 3 arguments are provided
if [ $# -lt 3 ]; then
    echo "ERROR:  3 arguments at least should be provided"
    exit 1
fi

# Get the last argument as the destination folder on the remote server
destination="${!#}"

# Remove the last argument from the list of arguments
files=("${@:1:$#-1}")

# local server information
local_server=$(hostname)

if [ "$local_server" = "server1" ];then
        remote_server=server2
         echo "remote_server: $remote_server"
        else
        remote_server=server1
        echo "remote_server: $remote_server"
fi

# Use sudo if the script is run as root
if [ "$(id -u)" -eq 0 ]; then
    scp_cmd="sudo scp"
else
    scp_cmd="scp"
fi


# Loop through the files and copy them to the remote server
total_bytes=0
for file in "${files[@]}"; do
    # Get the file size in bytes
    file_size=$(stat -c %s "$file")
    
     $scp_cmd scp "$file" "vagrant@$remote_server:$destination"
    
   
    total_bytes=$((total_bytes + file_size))
done

# Print the total number of bytes copied
echo "$total_bytes"



