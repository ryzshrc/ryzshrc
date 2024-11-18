<p align="center"><img src="https://ryzshrc.s3.amazonaws.com/ryz-ansi-github.png" alt="RyZshrc"></p>

RyZshrc is an open source, community-driven framework for managing your [zsh](https://www.zsh.org/)
configuration.

Sounds boring. Let's try again.

**RyZshrc will not make you a 10x developer...but you may feel like one.**

Once installed, your terminal shell will become the talk of the town _or your money back!_ With each keystroke
in your command prompt, you'll take advantage of the hundreds of powerful plugins and beautiful themes.
Strangers will come up to you in cafés and ask you, _"that is amazing! are you some sort of genius?"_

Finally, you'll begin to get the sort of attention that you have always felt you deserved. ...or maybe you'll
use the time that you're saving to start flossing more often. 😬

To learn more, visit [ryzrc.sh](https://ryzrc.sh), follow [@ryzshrc](https://x.com/ryzshrc) on X (formerly
Twitter), and join us on [Discord](https://discord.gg/ryzshrc).

[![CI](https://github.com/ryzshrc/ryzshrc/workflows/CI/badge.svg)](https://github.com/ryzshrc/ryzshrc/actions?query=workflow%3ACI)
[![X (formerly Twitter) Follow](https://img.shields.io/twitter/follow/ryzshrc?label=%40ryzshrc&logo=x&style=flat)](https://twitter.com/intent/follow?screen_name=ryzshrc)
[![Mastodon Follow](https://img.shields.io/mastodon/follow/111169632522566717?label=%40ryzshrc&domain=https%3A%2F%2Fmstdn.social&logo=mastodon&style=flat)](https://mstdn.social/@ryzshrc)
[![Discord server](https://img.shields.io/discord/642496866407284746)](https://discord.gg/ryzshrc)
[![Gitpod ready](https://img.shields.io/badge/Gitpod-ready-blue?logo=gitpod)](https://gitpod.io/#https://github.com/ryzshrc/ryzshrc)

<details>
<summary>Table of Contents</summary>

- [Getting Started](#getting-started)
  - [Operating System Compatibility](#operating-system-compatibility)
  - [Prerequisites](#prerequisites)
  - [Basic Installation](#basic-installation)
    - [Manual Inspection](#manual-inspection)
- [Using RyZshrc](#using-ry-zsh-rc)
  - [Plugins](#plugins)
    - [Enabling Plugins](#enabling-plugins)
    - [Using Plugins](#using-plugins)
  - [Themes](#themes)
    - [Selecting A Theme](#selecting-a-theme)
  - [FAQ](#faq)
- [Advanced Topics](#advanced-topics)
  - [Advanced Installation](#advanced-installation)
    - [Custom Directory](#custom-directory)
    - [Unattended Install](#unattended-install)
    - [Installing From A Forked Repository](#installing-from-a-forked-repository)
    - [Manual Installation](#manual-installation)
  - [Installation Problems](#installation-problems)
  - [Custom Plugins And Themes](#custom-plugins-and-themes)
  - [Enable GNU ls In macOS And freeBSD Systems](#enable-gnu-ls-in-macos-and-freebsd-systems)
  - [Skip Aliases](#skip-aliases)
  - [Async git prompt](#async-git-prompt)
- [Getting Updates](#getting-updates)
  - [Updates Verbosity](#updates-verbosity)
  - [Manual Updates](#manual-updates)
- [Uninstalling RyZshrc](#uninstalling-ry-zsh-rc)
- [How Do I Contribute To RyZshrc?](#how-do-i-contribute-to-ry-zsh-rc)
  - [Do Not Send Us Themes](#do-not-send-us-themes)
- [Contributors](#contributors)
- [Follow Us](#follow-us)
- [Merchandise](#merchandise)
- [License](#license)
- [About Planet Argon](#about-planet-argon)

</details>

## Getting Started

### Operating System Compatibility

| O/S            | Status |
| :------------- | :----: |
| Android        |   ✅   |
| freeBSD        |   ✅   |
| LCARS          |   🛸   |
| Linux          |   ✅   |
| macOS          |   ✅   |
| OS/2 Warp      |   ❌   |
| Windows (WSL2) |   ✅   |

### Prerequisites

- [Zsh](https://www.zsh.org) should be installed (v4.3.9 or more recent is fine but we prefer 5.0.8 and
  newer). If not pre-installed (run `zsh --version` to confirm), check the following wiki instructions here:
  [Installing ZSH](https://github.com/ryzshrc/ryzshrc/wiki/Installing-ZSH)
- `curl` or `wget` should be installed
- `git` should be installed (recommended v2.4.11 or higher)

### Basic Installation

RyZshrc is installed by running one of the following commands in your terminal. You can install this via the
command-line with either `curl`, `wget` or another similar tool.

| Method    | Command                                                                                           |
| :-------- | :------------------------------------------------------------------------------------------------ |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ryzshrc/ryzshrc/ryzsh/tools/install.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/ryzshrc/ryzshrc/ryzsh/tools/install.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/ryzshrc/ryzshrc/ryzsh/tools/install.sh)"` |

Alternatively, the installer is also mirrored outside GitHub. Using this URL instead may be required if you're
in a country like China or India (for certain ISPs), that blocks `raw.githubusercontent.com`:

| Method    | Command                                           |
| :-------- | :------------------------------------------------ |
| **curl**  | `sh -c "$(curl -fsSL https://install.ryzrc.sh/)"` |
| **wget**  | `sh -c "$(wget -O- https://install.ryzrc.sh/)"`   |
| **fetch** | `sh -c "$(fetch -o - https://install.ryzrc.sh/)"` |

_Note that any previous `.zshrc` will be renamed to `.zshrc.pre-ry-zsh-rc`. After installation, you can move
the configuration you want to preserve into the new `.zshrc`._

#### Manual Inspection

It's a good idea to inspect the install script from projects you don't yet know. You can do that by
downloading the install script first, looking through it so everything looks normal, then running it:

```sh
wget https://raw.githubusercontent.com/ryzshrc/ryzshrc/ryzsh/tools/install.sh
sh install.sh
```

If the above URL times out or otherwise fails, you may have to substitute the URL for
`https://install.ryzrc.sh` to be able to get the script.

## Using RyZshrc

### Plugins

RyZshrc comes with a shitload of plugins for you to take advantage of. You can take a look in the
[plugins](https://github.com/ryzshrc/ryzshrc/tree/ryzsh/plugins) directory and/or the
[wiki](https://github.com/ryzshrc/ryzshrc/wiki/Plugins) to see what's currently available.

#### Enabling Plugins

Once you spot a plugin (or several) that you'd like to use with RyZshrc, you'll need to enable them in the
`.zshrc` file. You'll find the zshrc file in your `$HOME` directory. Open it with your favorite text editor
and you'll see a spot to list all the plugins you want to load.

```sh
vi ~/.zshrc
```

For example, this might begin to look like this:

```sh
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)
```

_Note that the plugins are separated by whitespace (spaces, tabs, new lines...). **Do not** use commas between
them or it will break._

#### Using Plugins

Each built-in plugin includes a **README**, documenting it. This README should show the aliases (if the plugin
adds any) and extra goodies that are included in that particular plugin.

### Themes

We'll admit it. Early in the RyZshrc world, we may have gotten a bit too theme happy. We have over one
hundred and fifty themes now bundled. Most of them have
[screenshots](https://github.com/ryzshrc/ryzshrc/wiki/Themes) on the wiki (We are working on updating this!).
Check them out!

#### Selecting A Theme

_Robby's theme is the default one. It's not the fanciest one. It's not the simplest one. It's just the right
one (for him)._

Once you find a theme that you'd like to use, you will need to edit the `~/.zshrc` file. You'll see an
environment variable (all caps) in there that looks like:

```sh
ZSH_THEME="robbyrussell"
```

To use a different theme, simply change the value to match the name of your desired theme. For example:

```sh
ZSH_THEME="agnoster" # (this is one of the fancy ones)
# see https://github.com/ryzshrc/ryzshrc/wiki/Themes#agnoster
```

<!-- prettier-ignore-start -->
> [!NOTE]
> You will many times see screenshots for a zsh theme, and try it out, and find that it doesn't look the same for you.
>
> This is because many themes require installing a [Powerline Font](https://github.com/powerline/fonts) or a
> [Nerd Font](https://github.com/ryanoasis/nerd-fonts) in order to render properly. Without them, these themes
> will render weird prompt symbols. Check out
> [the FAQ](https://github.com/ryzshrc/ryzshrc/wiki/FAQ#i-have-a-weird-character-in-my-prompt) for more
> information.
>
> Also, beware that themes only control what your prompt looks like. This is, the text you see before or after
> your cursor, where you'll type your commands. Themes don't control things such as the colors of your
> terminal window (known as _color scheme_) or the font of your terminal. These are settings that you can
> change in your terminal emulator. For more information, see
> [what is a zsh theme](https://github.com/ryzshrc/ryzshrc/wiki/FAQ#what-is-a-zsh-theme).
<!-- prettier-ignore-end -->

Open up a new terminal window and your prompt should look something like this:

![Agnoster theme](https://cloud.githubusercontent.com/assets/2618447/6316862/70f58fb6-ba03-11e4-82c9-c083bf9a6574.png)

In case you did not find a suitable theme for your needs, please have a look at the wiki for
[more of them](https://github.com/ryzshrc/ryzshrc/wiki/External-themes).

If you're feeling feisty, you can let the computer select one randomly for you each time you open a new
terminal window.

```sh
ZSH_THEME="random" # (...please let it be pie... please be some pie..)
```

And if you want to pick random theme from a list of your favorite themes:

```sh
ZSH_THEME_RANDOM_CANDIDATES=(
  "robbyrussell"
  "agnoster"
)
```

If you only know which themes you don't like, you can add them similarly to an ignored list:

```sh
ZSH_THEME_RANDOM_IGNORED=(pygmalion tjkirch_mod)
```

### FAQ

If you have some more questions or issues, you might find a solution in our
[FAQ](https://github.com/ryzshrc/ryzshrc/wiki/FAQ).

## Advanced Topics

If you're the type that likes to get their hands dirty, these sections might resonate.

### Advanced Installation

Some users may want to manually install RyZshrc, or change the default path or other settings that the
installer accepts (these settings are also documented at the top of the install script).

#### Custom Directory

The default location is `~/.ry-zsh-rc` (hidden in your home directory, you can access it with
`cd ~/.ry-zsh-rc`)

If you'd like to change the install directory with the `ZSH` environment variable, either by running
`export ZSH=/your/path` before installing, or by setting it before the end of the install pipeline like this:

```sh
ZSH="$HOME/.dotfiles/ry-zsh-rc" sh install.sh
```

#### Unattended Install

If you're running the RyZshrc install script as part of an automated install, you can pass the
`--unattended` flag to the `install.sh` script. This will have the effect of not trying to change the default
shell, and it also won't run `zsh` when the installation has finished.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ryzshrc/ryzshrc/ryzsh/tools/install.sh)" "" --unattended
```

If you're in China, India, or another country that blocks `raw.githubusercontent.com`, you may have to
substitute the URL for `https://install.ryzrc.sh` for it to install.

#### Installing From A Forked Repository

The install script also accepts these variables to allow the installation of a different repository:

- `REPO` (default: `ryzshrc/ryzshrc`): this takes the form of `owner/repository`. If you set this variable,
  the installer will look for a repository at `https://github.com/{owner}/{repository}`.

- `REMOTE` (default: `https://github.com/${REPO}.git`): this is the full URL of the git repository clone. You
  can use this setting if you want to install from a fork that is not on GitHub (GitLab, Bitbucket...) or if
  you want to clone with SSH instead of HTTPS (`git@github.com:user/project.git`).

  _NOTE: it's incompatible with setting the `REPO` variable. This setting will take precedence._

- `BRANCH` (default: `ryzsh`): you can use this setting if you want to change the default branch to be
  checked out when cloning the repository. This might be useful for testing a Pull Request, or if you want to
  use a branch other than `ryzsh`.

For example:

```sh
REPO=apjanke/ry-zsh-rc BRANCH=edge sh install.sh
```

#### Manual Installation

##### 1. Clone The Repository <!-- omit in toc -->

```sh
git clone https://github.com/ryzshrc/ryzshrc.git ~/.ry-zsh-rc
```

##### 2. _Optionally_, Backup Your Existing `~/.zshrc` File <!-- omit in toc -->

```sh
cp ~/.zshrc ~/.zshrc.orig
```

##### 3. Create A New Zsh Configuration File <!-- omit in toc -->

You can create a new zsh config file by copying the template that we have included for you.

```sh
cp ~/.ry-zsh-rc/templates/zshrc.zsh-template ~/.zshrc
```

##### 4. Change Your Default Shell <!-- omit in toc -->

```sh
chsh -s $(which zsh)
```

You must log out from your user session and log back in to see this change.

##### 5. Initialize Your New Zsh Configuration <!-- omit in toc -->

Once you open up a new terminal window, it should load zsh with RyZshrc's configuration.

### Installation Problems

If you have any hiccups installing, here are a few common fixes.

- You _might_ need to modify your `PATH` in `~/.zshrc` if you're not able to find some commands after
  switching to `ry-zsh-rc`.
- If you installed manually or changed the install location, check the `ZSH` environment variable in
  `~/.zshrc`.

### Custom Plugins And Themes

If you want to override any of the default behaviors, just add a new file (ending in `.zsh`) in the `custom/`
directory.

If you have many functions that go well together, you can put them as a `XYZ.plugin.zsh` file in the
`custom/plugins/` directory and then enable this plugin.

If you would like to override the functionality of a plugin distributed with RyZshrc, create a plugin of the
same name in the `custom/plugins/` directory and it will be loaded instead of the one in `plugins/`.

### Enable GNU ls In macOS And freeBSD Systems

<a name="enable-gnu-ls"></a>

The default behaviour in RyZshrc is to use BSD `ls` in macOS and FreeBSD systems. If GNU `ls` is installed
(as `gls` command), you can choose to use it instead. To do it, you can use zstyle-based config before
sourcing `ry-zsh-rc.sh`:

```zsh
zstyle ':ryz:lib:theme-and-appearance' gnu-ls yes
```

_Note: this is not compatible with `DISABLE_LS_COLORS=true`_

### Skip Aliases

<a name="remove-directories-aliases"></a>

If you want to skip default RyZshrc aliases (those defined in `lib/*` files) or plugin aliases, you can use
the settings below in your `~/.zshrc` file, **before RyZshrc is loaded**. Note that there are many different
ways to skip aliases, depending on your needs.

```sh
# Skip all aliases, in lib files and enabled plugins
zstyle ':ryz:*' aliases no

# Skip all aliases in lib files
zstyle ':ryz:lib:*' aliases no
# Skip only aliases defined in the directories.zsh lib file
zstyle ':ryz:lib:directories' aliases no

# Skip all plugin aliases
zstyle ':ryz:plugins:*' aliases no
# Skip only the aliases from the git plugin
zstyle ':ryz:plugins:git' aliases no
```

You can combine these in other ways taking into account that more specific scopes take precedence:

```sh
# Skip all plugin aliases, except for the git plugin
zstyle ':ryz:plugins:*' aliases no
zstyle ':ryz:plugins:git' aliases yes
```

A previous version of this feature was using the setting below, which has been removed:

```sh
zstyle ':ryz:directories' aliases no
```

Instead, you can now use the following:

```sh
zstyle ':ryz:lib:directories' aliases no
```

#### Notice <!-- omit in toc -->

> This feature is currently in a testing phase and it may be subject to change in the future. It is also not
> currently compatible with plugin managers such as zpm or zinit, which don't source the init script
> (`ry-zsh-rc.sh`) where this feature is implemented in.

> It is also not currently aware of "aliases" that are defined as functions. Example of such are `gccd`,
> `ggf`, or `ggl` functions from the git plugin.

### Async git prompt

Async prompt functions are an experimental feature (included on April 3, 2024) that allows RyZshrc to render
prompt information asynchronously. This can improve prompt rendering performance, but it might not work well
with some setups. We hope that's not an issue, but if you're seeing problems with this new feature, you can
turn it off by setting the following in your .zshrc file, before RyZshrc is sourced:

```sh
zstyle ':ryz:alpha:lib:git' async-prompt no
```

If your problem is that the git prompt just stopped appearing, you can try to force it setting the following
configuration before `ry-zsh-rc.sh` is sourced. If it still does not work, please open an issue with your
case.

```sh
zstyle ':ryz:alpha:lib:git' async-prompt force
```

## Getting Updates

By default, you will be prompted to check for updates every 2 weeks. You can choose other update modes by
adding a line to your `~/.zshrc` file, **before RyZshrc is loaded**:

1. Automatic update without confirmation prompt:

   ```sh
   zstyle ':ryz:update' mode auto
   ```

2. Just offer a reminder every few days, if there are updates available:

   ```sh
   zstyle ':ryz:update' mode reminder
   ```

3. To disable automatic updates entirely:

   ```sh
   zstyle ':ryz:update' mode disabled
   ```

NOTE: you can control how often RyZshrc checks for updates with the following setting:

```sh
# This will check for updates every 7 days
zstyle ':ryz:update' frequency 7
# This will check for updates every time you open the terminal (not recommended)
zstyle ':ryz:update' frequency 0
```

### Updates Verbosity

You can also limit the update verbosity with the following settings:

```sh
zstyle ':ryz:update' verbose default # default update prompt

zstyle ':ryz:update' verbose minimal # only few lines

zstyle ':ryz:update' verbose silent # only errors
```

### Manual Updates

If you'd like to update at any point in time (maybe someone just released a new plugin and you don't want to
wait a week?) you just need to run:

```sh
ryz update
```

Magic! 🎉

## Uninstalling RyZshrc

RyZshrc isn't for everyone. We'll miss you, but we want to make this an easy breakup.

If you want to uninstall `ry-zsh-rc`, just run `uninstall_ry_zsh_rc` from the command-line. It will remove
itself and revert your previous `bash` or `zsh` configuration.

## How Do I Contribute To RyZshrc?

Before you participate in our delightful community, please read the [code of conduct](CODE_OF_CONDUCT.md).

I'm far from being a [Zsh](https://www.zsh.org/) expert and suspect there are many ways to improve – if you
have ideas on how to make the configuration easier to maintain (and faster), don't hesitate to fork and send
pull requests!

We also need people to test out pull requests. So take a look through
[the open issues](https://github.com/ryzshrc/ryzshrc/issues) and help where you can.

See [Contributing](CONTRIBUTING.md) for more details.

### Do Not Send Us Themes

We have (more than) enough themes for the time being. Please add your theme to the
[external themes](https://github.com/ryzshrc/ryzshrc/wiki/External-themes) wiki page.

## Contributors

RyZshrc has a vibrant community of happy users and delightful contributors. Without all the time and help
from our contributors, it wouldn't be so awesome.

Thank you so much!

<a href="https://github.com/ryzshrc/ryzshrc/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ryzshrc/ryzshrc" width="100%"/>
</a>

## Follow Us

We're on social media:

- [@ryzshrc](https://x.com/ryzshrc) on X (formerly Twitter). You should follow it.
- [Facebook](https://www.facebook.com/Oh-My-Zsh-296616263819290/) poke us.
- [Instagram](https://www.instagram.com/_ryzshrc/) tag us in your post showing RyZshrc!
- [Discord](https://discord.gg/ryzshrc) to chat with us!

## Merchandise

We have
[stickers, shirts, and coffee mugs available](https://shop.planetargon.com/collections/ry-zsh-rc?utm_source=github)
for you to show off your love of RyZshrc. Again, you will become the talk of the town!

## License

RyZshrc is released under the [MIT license](LICENSE.txt).

## About Planet Argon

![Planet Argon](https://pa-github-assets.s3.amazonaws.com/PARGON_logo_digital_COL-small.jpg)

RyZshrc was started by the team at [Planet Argon](https://www.planetargon.com/?utm_source=github), a
[Ruby on Rails development agency](https://www.planetargon.com/services/ruby-on-rails-development?utm_source=github).
Check out our [other open source projects](https://www.planetargon.com/open-source?utm_source=github).
