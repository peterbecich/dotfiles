df -h /home/ | tail -1 | awk -F ' ' '{ print $5 }'
 
