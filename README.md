# The Markdown Resume

## Instructions

```bash
git clone https://github.com/bdashrad/hireme
cd hireme
vim markdown/resume.md   #insert your own resume info
```

### Docker

```bash
docker-compose up -d
```

#### Requirements

* Docker
* Docker Compose

### Local

```bash
make
```

#### Requirements

When not using docker, you will need the following:

* ConTeXt 0.6x (TeX Live suggested)
* pandoc 2.x (1.x is no longer supported)

##### Debian / Ubuntu (tested)

```bash
sudo apt update
sudo apt install pandoc context
```

##### Mac OS

```bash
brew install pandoc
brew install --cask mactex
export PATH=$PATH:/Library/TeX/texbin/
```

### Troubleshooting

#### Context executable cannot be found

Some users have reported problems where their system does not properly find the ConTeXt
executable, leading to errors like `Cannot find context.lua` or similar. It has been found
that running `mtxrun --generate`, ([suggested on texlive-2011-context-problem](
https://tex.stackexchange.com/questions/53892/texlive-2011-context-problem)), can fix the
issue.

=======

Sample
-------

![resume_sample](https://cloud.githubusercontent.com/assets/2762198/15026479/892ee606-120c-11e6-8c94-ed6e3fc9bf90.png)
