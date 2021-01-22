SCRATCH_SPACE=/tmp/scratch

check_binary() {
    local name=$1
    if [ ! -f ~/.local/bin/$name ]; then
        true
        return
    else
        false
        return
    fi

}

extract_binary() {
    local url=$1
    local binary=$2
    local tmpdir=/tmp/scratch

    mkdir $SCRATCH_SPACE
    curl -SL $url | tar -xz -C $SCRATCH_SPACE --strip-components=1
    mv $SCRATCH_SPACE/$binary ~/.local/bin/
    rm -r $SCRATCH_SPACE

    return 0
}

# Install fzf
if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --no-update-rc --completion --key-bindings
fi

# Install autojump
if check_binary autojump; then
    mkdir $SCRATCH_SPACE
    git clone git://github.com/wting/autojump.git $SCRATCH_SPACE
    cd $SCRATCH_SPACE && python install.py -d ~/.local && cd -
    rm -rf $SCRATCH_SPACE
fi

# Install ripgrep
RG_VERSION=12.1.1
if check_binary rg; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/BurntSushi/ripgrep/releases/download/$RG_VERSION/ripgrep-$RG_VERSION-x86_64-apple-darwin.tar.gz
    else
        URL=https://github.com/BurntSushi/ripgrep/releases/download/$RG_VERSION/ripgrep-$RG_VERSION-x86_64-unknown-linux-musl.tar.gz
    fi

    extract_binary $URL rg
fi

# Install xsv
XSV_VERSION=0.13.0
if check_binary xsv; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/BurntSushi/xsv/releases/download/$XSV_VERSION/xsv-$XSV_VERSION-x86_64-apple-darwin.tar.gz
    else
        URL=https://github.com/BurntSushi/xsv/releases/download/$XSV_VERSION/xsv-$XSV_VERSION-x86_64-unknown-linux-musl.tar.gz
    fi

    curl -SL $URL | tar -xz -C ~/.local/bin

fi

# Install fd-find
FD_VERSION=8.1.1
if check_binary fd; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/sharkdp/fd/releases/download/v$FD_VERSION/fd-v$FD_VERSION-x86_64-apple-darwin.tar.gz
    else
        URL=https://github.com/sharkdp/fd/releases/download/v$FD_VERSION/fd-v$FD_VERSION-x86_64-unknown-linux-musl.tar.gz
    fi

    extract_binary $URL fd
fi

# Install bat
BAT_VERSION=0.15.4
if check_binary bat; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/sharkdp/bat/releases/download/v$BAT_VERSION/bat-v$BAT_VERSION-x86_64-apple-darwin.tar.gz
    else
        URL=https://github.com/sharkdp/bat/releases/download/v$BAT_VERSION/bat-v$BAT_VERSION-x86_64-unknown-linux-musl.tar.gz
    fi

    extract_binary $URL bat
fi

# Install dust
DUST_VERSION=0.5.1
if check_binary dust; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/bootandy/dust/releases/download/v$DUST_VERSION/dust-v$DUST_VERSION-x86_64-apple-darwin.tar.gz
    else
        URL=https://github.com/bootandy/dust/releases/download/v$DUST_VERSION/dust-v$DUST_VERSION-x86_64-unknown-linux-musl.tar.gz
    fi

    extract_binary $URL dust
fi

# Install tokei
TOKIE_VERSION=12.0.4
if check_binary tokei; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/XAMPPRocky/tokei/releases/download/v$TOKIE_VERSION/tokei-x86_64-apple-darwin.tar.gz
    else
        URL=https://github.com/XAMPPRocky/tokei/releases/download/v$TOKIE_VERSION/tokei-x86_64-unknown-linux-musl.tar.gz
    fi

    curl -SL $URL | tar -xz -C ~/.local/bin
fi

# Install exa
EXA_VERSION=0.9.0
if check_binary exa; then
    if [[ $OSTYPE == darwin* ]]; then
        URL=https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-macos-x86_64-$EXA_VERSION.zip
    else
        URL=https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64-$EXA_VERSION.zip
    fi
    curl -SL $URL | zcat > ~/.local/bin/exa
    chmod a+x ~/.local/bin/exa
fi

# install direnv
DIRENV_VERSION=2.21.3
if check_binary direnv; then
    if [[ $OSTYPE == darwin* ]]; then
	URL=https://github.com/direnv/direnv/releases/download/v${DIRENV_VERSION}/direnv.darwin-amd64
    else
	URL=https://github.com/direnv/direnv/releases/download/v{DIRENV_VERSION}/direnv.linux-amd64
    fi
    curl -SL $URL --output ~/.local/bin/direnv
    chmod a+x ~/.local/bin/direnv
fi

# install shfmt
SHFMT_VERSION=3.1.2
if check_binary shfmt; then
    if [[ $OSTYPE == darwin* ]]; then
	URL=https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_darwin_amd64
    else
	URL=https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64
    fi
    curl -SL $URL --output ~/.local/bin/shfmt
    chmod a+x ~/.local/bin/shfmt
fi

