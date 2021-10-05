#!/bin/bash

cd /app/recipes/$1

fpm-cook install-deps
fpm-cook package
cd /app

rm *.deb
rm -r out
mkdir out
mv recipes/*/pkg/*.deb out || mv recipes/*/pkg/* out
cd out
echo "::set-output name=path::$(ls *)"