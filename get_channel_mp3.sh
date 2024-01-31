#!/usr/bin/env bash

yt-dlp -f 'ba' --audio-format mp3 --download-archive mp3_audio.txt http://www.youtube.com/@camille.griselin/videos -o 'mp3/%(title)s [%(id)s].mp3'
