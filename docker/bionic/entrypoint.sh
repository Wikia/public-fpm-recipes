#!/bin/bash

cd /app/recipes/$1

sudo fpm-cook install-deps
fpm-cook package
cd /app

rm *.deb
mv recipes/*/pkg/*.deb .
echo "::set-output name=path::$(ls *.deb)"