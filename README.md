The Markdown Resume
===================

### Instructions
```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
vim markdown/resume.md   # insert your own resume info
make
```

### Running Dockerized
```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
vim markdown/resume.md   # insert your own resume info
docker-compose up -d
```

### Requirements

* ConTeXt 0.6X
* pandoc 2.x
    * 1.x is deprecated

Last tested on the above versions and that's not to say the later versions won't work. Please try to use the latest versions when possible.

#### Debian / Ubuntu

```bash
sudo apt install pandoc context
```

#### Fedora
```bash
sudo dnf install pandoc texlive-collection-context
```

#### Arch
```bash
sudo pacman -S pandoc texlive-core
```

#### OSX
```bash
brew install pandoc
mkdir $HOME/context
cd $HOME/context
rsync -av rsync://contextgarden.net/minimals/setup/first-setup.sh .
sh ./first-setup.sh --modules=all --engine=luatex
```

### Troubleshooting

#### Get versions

Check if the dependencies are up to date.

```
context --version
pandoc --version
```

#### Cannot process lua
Currently pandoc 1.x may be within your distro's repos and the latest version should be used. See the
[pandoc releases](https://github.com/jgm/pandoc/releases) for your distro.

e.g. for Debian / Ubuntu
```
wget https://github.com/jgm/pandoc/releases/download/2.2.1/pandoc-2.2.1-1-amd64.deb
sudo dpkg -i pandoc-2.2.1-1-amd64.deb
```

#### Context executable cannot be found
Some users have reported problems where their system does not properly find the ConTeXt
executable, leading to errors like `Cannot find context.lua` or similar. It has been found
that running `mtxrun --generate`, (as suggested at
https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem), can fix the
issue.
