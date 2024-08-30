#!/bin/sh
cat sample.txt|grep -i -n "si"
sed '/si/a\New text ' sample2.txt
sed '/New text /a\si' sample2.txt