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
brew cask install mactex
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
that running `mtxrun --generate`, ([suggested on texlive-2011-context-problem](
https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem)), can fix the
issue.

### Short version
In order to maintain easily two versions, one long and one short,
of the resume, a marker can be added at the very end to lines in `resume.md`. Any line tagged this way will not appear in the automatically
generated short version of the resume.

The short resume and consequent compiled files is stored under `short_resume.md` and similar.

The file `long_marker` contains the tag used to mark lines
of the long version. Note that this tag is expressed as a regex, and its default value is `[LONG]`.
