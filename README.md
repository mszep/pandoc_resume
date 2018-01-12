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


### Short version
In order to maintain easily two versions, one long and one short,
of the resume, a marker can be added at the very end to lines in `resume.md`. Any line tagged this way will not appear in the automatically
generated short version of the resume.

The short resume and consequent compiled files is stored under `short_resume.md` and similar.

The file `long_marker` contains the tag used to mark lines
of the long version. Note that this tag is expressed as a regex, and its default value is `[LONG]`.
