#!/bin/sh
#
# check_5g_bw.sh
# Check if the 5GHz channel bandwidth is below 160MHz, and if so, restart the acsd service.

# 5GHz interface (depends on the router model, could be eth7 or eth8)
IFACE="eth7"

# Read the current chanspec
CHANINFO=$(wl -i $IFACE chanspec 2>/dev/null)

# Exit if no data was retrieved
[ -z "$CHANINFO" ] && {
    echo "Unable to read chanspec from $IFACE"
    exit 1
}

echo "Current chanspec on $IFACE: $CHANINFO"

# Check if it contains /160
echo "$CHANINFO" | grep -q "/160"
if [ $? -eq 0 ]; then
    echo "✅ Bandwidth is 160MHz, no action needed"
else
    echo "⚠️ Bandwidth is below 160MHz, executing service restart_acsd ..."
    service restart_acsd
fi
