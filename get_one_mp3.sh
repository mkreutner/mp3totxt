#!/usr/bin/env bash

yt-dlp -x --audio-format mp3 $1 -o 'mp3/%(title)s.mp3'
