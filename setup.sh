:
cd ~
cp ~/dot-files/.zshrc ~/.zshrc
cp ~/dot-files/.vimrc ~/.vim/vimrc

INSTALL_MINPAC=false
INSTALL_FZF=false
INSTALL_PROJECTIONIST=false

while getopts ifp opt;
do
	case $opt in
		i) INSTALL_MINPAC=true ;;
		f) INSTALL_FZF=true ;;
		p) INSTALL_PROJECTIONIST=true ;;
	esac
done

if [[ "$INSTALL_MINPAC" == true ]]
then
	mkdir -p $VIMCONFIG/pack/minpac/opt
	cd $VIMCONFIG/pack/minpac/opt
	git clone https://github.com/k-takata/minpac.git
fi

# installing fuzzy finder.
if [[ "$INSTALL_FZF" == true ]]
then
	cd $VIMCONFIG/pack/bundle/start
	git clone https://github.com/junegunn/fzf
	$VIMCONFIG/pack/bundle/start/fzf/install --bin
	brew install ripgrep
fi

# installing fuzzy finder.
if [[ "$INSTALL_PROJECTIONIST" == true ]]
then
	cd $VIMCONFIG/pack/bundle/start
	git clone https://github.com/tpope/vim-projectionist.git
fi


