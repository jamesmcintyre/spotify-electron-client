#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing Nativefier Globally" &&
  npm install nativefier -g
  cd ~/Desktop &&
  mkdir spofity-electron-temp &&
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
  open https://jamesmcintyre.github.io/spotify-electron-client/ &&
else
  echo "Sorry, this script only works for Mac OS right now"
  echo "Feel free to fork and submit a PR with adaptations for your OS:"
  echo "https://github.com/jamesmcintyre/spotify-electron-client"
fi
