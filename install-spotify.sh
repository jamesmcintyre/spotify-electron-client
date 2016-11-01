#!/bin/bash
function node_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type node >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}
function install_spotify_electron_client {
  echo "Installing Nativefier Globally" &&
  npm install nativefier -g
  cd ~/Desktop &&
  mkdir spotify-electron-temp &&
  cd spotify-electron-temp &&
  echo "Natifying Spotify" &&
  curl -O 'https://jamesmcintyre.github.io/spotify-electron-client/spotify_icon.icns' &&
  nativefier --name "Spotify" --flash --icon ./spotify_icon.icns "https://play.spotify.com/browse" . &&
  cd * &&
  mv Spotify.app /Applications/ &&
  cd ../.. &&
  echo "Cleanup" &&
  npm uninstall -g nativefier &&
  rm -rf spotify-electron-temp/ &&
  open /Applications/Spotify.app &&
  echo "Viola!" &&
  echo "It'd mean a lot if you starred my repo!" &&
  echo "https://github.com/jamesmcintyre/spotify-electron-client" &&
  open https://jamesmcintyre.github.io/spotify-electron-client/thanks.html &&
  exit 1
}
function confirmPrompt {
  printf "\033c"
  echo
  echo
  echo "   _____             _   _  __         ______ _           _                   ";
  echo "  / ____|           | | (_)/ _|       |  ____| |         | |                  ";
  echo " | (___  _ __   ___ | |_ _| |_ _   _  | |__  | | ___  ___| |_ _ __ ___  _ __  ";
  echo "  \___ \| '_ \ / _ \| __| |  _| | | | |  __| | |/ _ \/ __| __| '__/ _ \| '_ \ ";
  echo "  ____) | |_) | (_) | |_| | | | |_| | | |____| |  __/ (__| |_| | | (_) | | | |";
  echo " |_____/| .__/ \___/ \__|_|_|  \__, | |______|_|\___|\___|\__|_|  \___/|_| |_|";
  echo "        | |                     __/ |                                         ";
  echo "        |_|                    |___/                                          ";
  echo
  echo
  echo "This script requires that you have node installed on your system."
  echo "It will use the nativefier npm package to create an Electron app that"
  echo "will simply wrap https://play.spotify.com/browse. It will place"
  echo "the resulting Spotify.app file in the /Applications folder."
  echo
  read -p "Do you wish to run this Spotify Electron Client Install script? " -n 1 -r
  echo
}
function unsupportedOS {
  echo "Sorry, this script only works for Mac OS right now"
  echo "Feel free to fork and submit a PR with adaptations for your OS:"
  echo "https://github.com/jamesmcintyre/spotify-electron-client"
  exit 1
}
function nodeNotInstalled {
  echo "node installation not found! We need node!"
  echo "get node here: https://goo.gl/8HqJfM"
  open https://goo.gl/8HqJfM
  exit 1
}
function declineInstall {
  echo "Ok, if you want to see what the script does:"
  echo "https://github.com/jamesmcintyre/spotify-electron-client/blob/master/install-spotify.sh"
  open https://github.com/jamesmcintyre/spotify-electron-client/blob/master/install-spotify.sh
  exit 1
}

NODE_INSTALLED="$(node_is_installed)"

confirmPrompt
if [[ $REPLY =~ ^[Yy]$ ]]
then
  if [[ "$NODE_INSTALLED" = 1 ]]
  then
    if [[ "$OSTYPE" == "darwin"* ]]
    then
      install_spotify_electron_client
    else
      unsupportedOS
    fi
  else
    nodeNotInstalled
  fi
else
  declineInstall
fi
