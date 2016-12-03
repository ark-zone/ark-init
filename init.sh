#!/bin/sh

read -p "[?] Enter the project name: " project_name

if
[ ! $project_name ]
then
echo "[*] Bye!"
exit 0
fi

read -p "[?] Enter you project git-url: " git_url

echo "[1] Install react-native@0.38.0 .."
react-native init $project_name --verbose --version 0.38.0

cd $project_name

echo "[2] Install third-party modules .."
npm install react-native-vector-icons@3.0.0 --save
npm install redux@3.6.0 --save
npm install redux-thunk@2.1.0 --save
npm install react-redux@4.4.6 --save
npm install leancloud-storage@1.5.2 --save

if
[ $git_url ]
then
echo "[3] Clone git project code.. "
git clone $git_url __arkapp__
fi

echo "[+] Initialize the project .."
react-native link react-native-vector-icons

entry_file=index.ios.js

echo "import { AppRegistry } from 'react-native';" > $entry_file
echo "import App from './__arkapp__/';" >> $entry_file
echo "" >> $entry_file
echo "AppRegistry.registerComponent('$project_name', () => App);" >> $entry_file

echo "[*] Done!"
