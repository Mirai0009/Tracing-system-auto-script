# Script to find URLs from testing.txt
# Author Miraiwangy
#!/bin/bash

echo "Checking for link..."

result=$(strings testing.txt | grep -Eo "https://gs.hoyoverse.com/(.+)|.+game_biz=hkrpg_global" | grep -v "|" | head -2 | tr -d "\n")

if [ -z "$result" ]; then
  result=$(strings testing.txt | grep -Eo "https://api-os-takumi.mihoyo.com(.+)|.+game_biz=hkrpg_global" | grep -v "|" | tail -2 | tr -d "\n")
fi

if [ -z "$result" ]; then
  echo -e "\nLink not found make sure you following instructions"
else
  echo -e "\n$result"
fi