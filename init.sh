#!/bin/sh

read -p "[?] Enter the project name: " project_name

echo "[1] Install react-native@0.38.0 .."
react-native init $project_name --verbose --version 0.38.0

cd $project_name

echo "[2] Install third-party modules .."
npm install react-native-vector-icons@3.0.0 --save
npm install redux@3.6.0 --save
npm install redux-thunk@2.1.0 --save
npm install react-redux@4.4.6 --save
npm install leancloud-storage@1.5.2 --save

echo "[3] Initialize the project .."
react-native link react-native-vector-icons

