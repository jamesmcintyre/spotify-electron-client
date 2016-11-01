# Spotify Electron Client

When I read on Hacker News that the native desktop Spotify client is executing unusually high amounts of read/Write
to disk I wondered if there existed an electron wrapper around the official web client but to my surprise there wasn't. Upon looking into how I'd make one myself I stumbled upon [this repo](https://github.com/jiahaog/nativefier) and used the api to slightly customize the way Natifier generates the electron app. After doing this I realized it would be cool to write a bash script with does all the steps for you and that's what this repo is for! It's just a simple bash script you can run with a single command to install the Spotify Electron Client!

![ Screenshot ](https://jamesmcintyre.github.io/spotify-electron-client/assets/imgs/screenshot.jpg)

## Installation

You can run the install script without git cloning or anything, just run this single command in your MacOS terminal:

`bash <(curl -fsSL https://raw.githubusercontent.com/jamesmcintyre/spotify-electron-client/master/install-spotify.sh)`

If you want to look at the script before running it: [install-spotify.sh](https://github.com/jamesmcintyre/spotify-electron-client/blob/master/install-spotify.sh)

## Contributing

I have only wrote an install script which I know will work on Mac OS (OSX) so please feel free to update the script to support Linux or Windows.

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credits

[@jiahaog](https://github.com/jiahaog) built the awesome Nativefier, I just wrote a measly bash script!
