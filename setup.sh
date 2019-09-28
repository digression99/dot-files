cd ~
cp ~/dot-files/.zshrc ~/.zshrc
cp ~/dot-files/.vimrc ~/.vim/vimrc


INSTALL_PACKAGES=false
INSTALL_PROGRAMS=false

while getopts ifp opt;
do
	case $opt in
		i) INSTALL_PACKAGES=true ;;
		b) INSTALL_PROGRAMS=true ;;
	esac
done

if [[ "$INSTALL_PACKAGES" == true ]]
then
	mkdir -p $VIMCONFIG/pack/minpac/opt
	cd $VIMCONFIG/pack/minpac/opt
	git clone https://github.com/k-takata/minpac.git

	cd $VIMCONFIG/pack/bundle/start
	git clone https://github.com/junegunn/fzf
	$VIMCONFIG/pack/bundle/start/fzf/install --bin

	git clone https://github.com/tpope/vim-projectionist.git
	git clone https://github.com/tpope/vim-dispatch.git
fi

# install programs
if [[ "$INSTALL_PROGRAMS" == true ]]
then
	brew install ripgrep
	brew install ctags
fi

