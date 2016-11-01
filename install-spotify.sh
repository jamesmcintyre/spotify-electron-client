#!/bin/bash
echo "Installing Nativefier Globally" &&
# && npm install nativefier -g
cd ~/Desktop &&
mkdir natified_spotify &&
cd natified_spotify &&
echo "Natifying Spotify" &&
curl -O 'https://jamesmcintyre.github.io/spotify-electron-client/spotify_icon.icns' &&
nativefier --name "Spotify" --flash --icon ./spotify_icon.icns "https://play.spotify.com/browse" . &&
cd * &&
mv Spotify.app /Applications/ &&
cd ../.. &&
echo "Cleanup" &&
rm -rf natified_spotify/ &&
open /Applications/Spotify.app &&
echo "Viola!" &&
echo "It'd mean a lot if you starred my repo!"
echo "https://github.com/jamesmcintyre/spotify-electron-client"
open https://jamesmcintyre.github.io/spotify-electron-client/
