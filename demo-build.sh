#!/bin/bash

cd example
flutter build web --base-href "/triones-antd-mobile-flutter/web/"

cp -r build/web/* ../website/public/web