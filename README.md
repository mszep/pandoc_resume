The Markdown Resume
===================

### Instructions

```bash
git clone https://github.com/mszep/pandoc_resume
cd pandoc_resume
vim markdown/resume.md   # insert your own resume info
```

#### Local

Make everything

```bash
make
```

Make specifics

```bash
make pdf
make html
```

#### Dockerized

Make everything

```bash
docker-compose up -d
```

### Requirements

If not using `docker` then you will need the following dependencies.

* ConTeXt 0.6x
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
sudo pacman -S pandoc texlive
```

#### OSX
```bash
brew install pandoc
brew install --cask mactex
```

Make sure to add the directory `/Library/TeX/texbin/` to your path or `context` and `mtxrun` will not be found.

```
export PATH=$PATH:/Library/TeX/texbin/
```

#### Nix

Make sure to enable flakes, see [this](https://nixos.wiki/wiki/Flakes).

```bash
nix build
```

The built resume will end up in `./result`.

Additionally, this project's flake overlay output exposes the function
`pandocResume.buildResume` for building a resume stored somewhere other than
[the default location](#instructions):

```nix
{
  description = "Flake for building my resume";

  inputs = { pandoc_resume.url = "github:mszep/pandoc_resume"; };

  outputs = { self, nixpkgs, pandoc_resume }:
    {
      packages.x86_64-linux =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [ pandoc_resume.overlays.pandocResume ]; };

          myResume = pkgs.pandocResume.buildResume {
            # Mandatory.
            #
            # Must specify a directory containing a resume whose basename
            # includes the extension `.md`.
            inDir = "${self}/my-resume";

            # Optional.
            #
            # The specified directory must contain the files `<style>.css` and
            # `<style>.tex` for each supported style `<style>`.
            #
            # Defaults to "${pandoc_resume}/styles".
            stylesDir = "${self}/my-styles";

            # Optional.
            #
            # Given "my-style", `stylesDir` must contain `my-style.css` and
            # `my-style.tex`.
            #
            # Defaults to "chmduquesne".
            style = "my-style";
          };
        in
        {
          inherit myResume;
          default = myResume;
        };
    };
}
```

In the example above, you can build your resume by running the following from
your flake's top-level directory (assuming you are on an `x86_64-linux`
system):

```
nix build
```

Or, equivalently:

```
nix build '.#myResume'
```

Or via any valid [flake reference](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html#flake-references).
For instance, if the flake containing your resume is hosted at
`https://my.git.host/my-flake`, you can build it with:

```
nix build 'git+https://my.git.host/my-flake#myResume'
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
