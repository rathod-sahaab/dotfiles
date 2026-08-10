#!/usr/bin/env bash

df_out=$(df -h / "/run/media/rathod-sahaab/Files SSD" 2>/dev/null)
root_info=$(echo "$df_out" | awk 'NR==2 {print "Root (/): " $3 "/" $2 " (" $4 " free)"}')
ssd_info=$(echo "$df_out" | awk 'NR==3 {print "Files SSD: " $3 "/" $2 " (" $4 " free)"}')

tooltip="${root_info}\n${ssd_info}"
printf '{"text":"","tooltip":"%s"}\n' "$tooltip"
