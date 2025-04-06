#!/bin/bash
#flutter build web --release  --base-href "/triones-antd-mobile-flutter/web/"
cd example
flutter build web --base-href "/triones-antd-mobile-flutter/web/"

cp -r build/web/* ../website/public/web