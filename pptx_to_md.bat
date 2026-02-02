@echo off
rem https://pandoc.org/
rem https://sourceforge.net/projects/getgnuwin32/files/
rem --wrap=auto|none|preserve
pushd "%~dp1"
pandoc --wrap=preserve -f pptx -t gfm "%~nx1" -o "%~nx1.md" --extract-media="%~nx1.media"

rem Change absolute links into relative, put links into <> brackets
cat "%~nx1.md" | sed -r "s/\(.*(%~nx1.media[^ )]+)/(<\1>/g" > "%~nx1.mod.1.md"

rem Remove line breaks from within "![](...)" markdown image links
cat "%~nx1.mod.1.md" | tr "\n" "\f" | sed -r "s/(!\[[^]\r\f]*)(\r\f)+/\1 /g" | tr "\f" "\n" > "%~nx1.mod.2.md"

rem Clean up
mv "%~nx1.mod.2.md" "%~nx1.md"
rm -rf "%~nx1.mod.1.md"
popd
