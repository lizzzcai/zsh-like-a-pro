# zsh-like-a-pro

As zsh is the default Shell of Mac OS now, here I summary the steps to setup zsh so that one can increase their productivity.

# Install homebrew

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
During the above installation, you may be asked to install the command line developer tools for `xcode-select` command, go ahead and install it and then finish the Homebrew installation, once it’s completed, you will be able to use brew command to install iTerm2.


# Install iTerm2

[iTerm2](https://www.iterm2.com/) is a replacement for Terminal on macOS.
```bash
$ brew cask install iterm2
```

# Install Oh My Zsh

[Oh My Zsh](https://ohmyz.sh/) is a framework for managing Zsh configuration and it comes with many helpful plugins, themes etc to make you enjoy shell scripting.

```bash
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

wiki: [Oh My Zsh wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)

# Powerlevel10k Theme

[Powerlevel10k](https://github.com/romkatv/powerlevel10k#) is a fast reimplementation of Powerlevel9k which is probably the most popular Powerline theme for Zsh.

## Installation
```bash
# install manually
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
```
This is the simplest kind of installation and it works even if you are using a plugin manager. Just make sure to disable your current theme in your plugin manager. See [FAQ](https://github.com/romkatv/powerlevel10k#i-cannot-make-powerlevel10k-work-with-my-plugin-manager-help) for help.


```bash
# install with Oh My Zsh (Recommended)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
Set `ZSH_THEME=powerlevel10k/powerlevel10k` in your `~/.zshrc`.

More themes in oh my zh please refer [default themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

## Configuration
On the first run, Powerlevel10k configuration wizard will ask you a few questions and configure your prompt. If it doesn't trigger automatically, type `p10k configure`. You can further customize your prompt by editing `~/.p10k.zsh`.

prompt customization please refer [prompt-customization](https://github.com/Powerlevel9k/powerlevel9k#prompt-customization).

## Fronts
Powerlevel10k doesn't require custom fonts but can take advantage of them if they are available. It works well with `Nerd Fonts`, `Source Code Pro`, `Font Awesome`, `Powerline`, and even the default system fonts. The full choice of style options is available only when using [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).

### Font Installation
```bash
$ brew tap homebrew/cask-fonts
$ brew cask install font-hack-nerd-font
```

### Configure your terminal to use this font
- **iTerm2**: Type `p10k configure`, answer `Yes` when asked whether to install Meslo Nerd Font and restart iTerm2 for the changes to take effect. Alternatively, open *iTerm2 → Preferences → Profiles → Text* and set Font to `MesloLGS NF`.

- **Visual Studio Code**: Open *File → Preferences → Settings*, enter `terminal.integrated.fontFamily` in the search box and set the value to `MesloLGS NF`.

Run `p10k configure` to pick the best style for your new font.

Any issue please refer [FAQ](https://github.com/romkatv/powerlevel10k#faq)

## Color Theme

open iTerm2 preferences dialog, go to **iTerm2 → Preferences → Profiles → Colors*, choose `Solarized Dark color` preset.

## Plugins

### incr
https://mimosa-pudica.net/zsh-incremental.html

Incremental completion on zsh

1. Download the plugin
```bash
$ mkdir $ZSH_CUSTOM/plugins/incr
$ wget http://mimosa-pudica.net/src/incr-0.2.zsh -O $ZSH_CUSTOM/plugins/incr/incr.plugin.zsh
```
2. Activate the plugin in `~/.zshrc`:

```
plugins=( [plugins...] incr)
```

### zsh-autosuggestions
https://github.com/zsh-users/zsh-autosuggestions

It suggests commands as you type based on history and completions.

1. Clone the repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)
```sh
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

```sh
plugins=( [plugins...] zsh-autosuggestions)
```

3. How to use

As you type commands, you will see a completion offered after the cursor in a muted gray color. This color can be changed by setting the `ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE` variable. See [configuration](https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#configuration).

If you press the <kbd>→</kbd> key (`forward-char` widget) or <kbd>End</kbd> (`end-of-line` widget) with the cursor at the end of the buffer, it will accept the suggestion, replacing the contents of the command line buffer with the suggestion.

If you invoke the `forward-word` widget, it will partially accept the suggestion up to the point that the cursor moves to.


### autojump
https://github.com/wting/autojump

autojump is a faster way to navigate your filesystem.
1. Install by brew
```bash
$ brew install autojump
```

2. Activate the plugin in `~/.zshrc`:
```
plugins=( [plugins...] autojump)
```

3. How to use
```
refer: https://github.com/wting/autojump
```

### syntax-highlighting

https://github.com/zsh-users/zsh-syntax-highlighting

This package provides syntax highlighting for the shell zsh. It enables highlighting of commands whilst they are typed at a zsh prompt into an interactive terminal. This helps in reviewing commands before running them, particularly in catching syntax errors.


1. Clone this repository in oh-my-zsh's plugins directory:
```bash
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

2. Activate the plugin in `~/.zshrc`:

```
plugins=( [plugins...] zsh-syntax-highlighting)
```
Note that `zsh-syntax-highlighting` must be the last plugin sourced.

3. Restart zsh (such as by opening a new instance of your terminal emulator).

### add plugins into .zshrc
```
plugins=(
    git
    incr
    zsh-autosuggestions
    autojump
    zsh-syntax-highlighting
    )
```


# Deploy the .zshrc to HOME

1. Check the difference
```bash
$ make diff
```

2. Backup the config
```bash
$ make backup
```

3. Copy it to HOME
```bash
$ make copy
```


# Deploy the .p10k.zsh to HOME

1. Check the difference
```bash
$ make diff
```
2. Backup the config
```bash
$ make backup
```
3. Copy it to HOME
```bash
$ make copy
```