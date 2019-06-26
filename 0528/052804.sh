#sudo ls /var | sort -nr | head -n 5 
sudo ls -Rl /var | awk '{print $9, $5}' | sort -nr -k 2 | head -n 5
