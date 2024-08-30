#!/bin/sh

mkdir mac1 mac
touch mktxt1.txt mktxt.txt
cp mktxt.txt mktxt1.txt
cp -r mac1 mac
mv mktxt1.txt mac1/
mv mac1 mac2
cd mac2
rm mktxt1.txt mktxt.txt
cd ..
rm -r mac2 mac