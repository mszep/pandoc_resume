The Markdown Resume
===================

### Instructions
```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
vim resume.md   # insert your own resume info
make
```

### Running Dockerized
```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
vim resume.md   # insert your own resume info
docker-compose up -d
```

### Requirements

 * ConTeXt
 * pandoc

#### Debian
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
