#!/bin/sh
# Create an m3u playlist by searching this folder recursively

find . -type f \( -name '*.mp3' -or -name '*.flac' -or -name '*.ogg' -or -name '*.opus' -or -name '*.m4a'\) > pl.m3u
 
