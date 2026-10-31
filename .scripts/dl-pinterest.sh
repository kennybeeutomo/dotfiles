#!/usr/bin/env bash
# Script to download pinterest content in source quality
# Dependencies: wget yt-dlp
# Todo: use pup to parse html

href=$1
ext=${2:-jpg}

case $ext in
	mp4 )
		yt-dlp -t mp4 "$href"
		;;
	* )
		wget "$(curl -Ls "$href" | grep -o -m 1 "https://i\.pinimg\.com/originals/[a-z0-9/]*\.$ext" | head -n 1)"
		;;
esac
