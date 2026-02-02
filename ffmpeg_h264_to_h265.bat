@echo off
rem https://www.ffmpeg.org/
rem ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i "%~1" -c:v libx265 -vtag hvc1 "%~dpn1.h265.mp4"
ffmpeg -i "%~1" -c:v libx265 -vtag hvc1 "%~dpn1.h265.mp4"