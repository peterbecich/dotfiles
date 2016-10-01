amixer get Master | awk -F'[\[\]]' '{if ($6 == "off") {print "MUT"; } else { print $2; }}' | tail -n 1
