# Script to find URLs from testing.txt
# Author Miraiwangy 
#!/bin/bash

echo "Checking for link..."

result=$(strings testing.txt | grep -Eo "https://gs.hoyoverse.com/(.+)|.+3d&game_biz=hk4e_global#/log" | grep -v "|" | head -2 | tr -d "\n")

if [ -z "$result" ]; then
  result=$(strings testing.txt | grep -Eo "https://hk4e-api-os.hoyoverse.com(.+)|.+&game_biz=hk4e_global" | grep -v "|" | tail -2 | tr -d "\n")
fi

if [ -z "$result" ]; then
  echo "Link not found, make sure you following instructions"
else
  echo -e "\n$result"
fi
