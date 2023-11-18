#!/bin/sh

if ip link | rg -q wg-mullvad; then
    echo "󰖂"
else
    echo ""
fi
