@echo off
rem https://sourceforge.net/projects/getgnuwin32/files/
rem Fix terminology in meeting transcripts
tr "\n" "\f" | sed -E -f "%~dp0fixterm.patterns.txt" | tr "\f" "\n"