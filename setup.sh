
# copying all rc files.
# cp ~/dot-files/.zshrc ~/.zshrc

# TODO - need to copy all ftpplugin files if exist
cp ~/dot-files/.vimrc ~/.vim/vimrc

# copying all ftplugin files.
cp -r ~/dot-files/ftplugin ~/.vim

# copying compiler files.
cp -r ~/dot-files/compiler ~/.config/nvim/after

# setup init.vim
cp ~/dot-files/init.vim ~/.config/nvim/init.vim

INSTALL_PACKAGES=false
INSTALL_PROGRAMS=false

while getopts ib opt;
do
	case $opt in
		i) INSTALL_PACKAGES=true ;;
		b) INSTALL_PROGRAMS=true ;;
	esac
done

if [[ "$INSTALL_PACKAGES" == true ]]
then
    # TODO - how can I initially setup minpac without this?
	mkdir -p $VIMCONFIG/pack/minpac/opt
	cd $VIMCONFIG/pack/minpac/opt
	git clone https://github.com/k-takata/minpac.git

	cd $VIMCONFIG/pack/bundle/start
	git clone https://github.com/junegunn/fzf
	$VIMCONFIG/pack/bundle/start/fzf/install --bin

    # just run :call minpac#update() inside vim.
	# git clone https://github.com/tpope/vim-projectionist.git
	# git clone https://github.com/tpope/vim-dispatch.git
	# git clone https://github.com/radenling/vim-dispatch-neovim.git
fi

# install programs
if [[ "$INSTALL_PROGRAMS" == true ]]
then
	brew install ripgrep
	brew install ctags
    # installing iterm2 nightly
    brew tap homebrew/cask-versions
    brew cask install iterm2-nightly
fi

