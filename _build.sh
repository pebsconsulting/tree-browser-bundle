#!/usr/bin/env bash
set -e

echo " * Installing Bower dependencies..."
bower install

echo ""
echo " * Executing webpack..."
# Compile all javascript files and minify them together with Fancytree
webpack -p --progress

echo ""
echo " * Copying required vendor files to public directory..."
# jQuery
if [ ! -d "./Resources/public/vendor/jquery" ]; then
    mkdir -p ./Resources/public/vendor/jquery/dist
fi
cp ./bower_components/jquery/dist/jquery.min.js ./Resources/public/vendor/jquery/dist/jquery.min.js

# jQuery UI
if [ ! -d "./Resources/public/vendor/jquery-ui" ]; then
    mkdir ./Resources/public/vendor/jquery-ui
fi
cp ./bower_components/jquery-ui/jquery-ui.min.js ./Resources/public/vendor/jquery-ui/jquery-ui.min.js
