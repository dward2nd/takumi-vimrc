# Takumi `.vimrc` file

This is my VIM configuration file I'm currently using.

If you want to replicate, I'd assume that your computer runs on Unix/Linux.

1. Clone this repository.

```bash
git clone https://github.com/dward2nd/takumi-vimrc
```

2. Install VimPlug, the plugin manager for vim which I use for this config.

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

3. Install Node.js with version >= 10 (Recommended: 12 LTS)

for macOS using Homebrew:
```bash
brew install node
```

for Ubuntu:
```bash
sudo apt install node
```

4. Enter `vim`, then run the command
```bash
:PlugInstall
```
This will install every plugin listed in `.vimrc` file.

*Note: I'm not sure if there's any other libraries to be manually install,
such as C++ compiler, which could be required by some plugins. Node.js is
required by `coc.nvim`*
