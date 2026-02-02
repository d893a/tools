@echo off
rem https://pandoc.org/
rem --wrap=auto|none|preserve
pandoc --wrap=preserve -f docx -t gfm "%~1" > "%~1.md"
