cd ~
cp ~/dot-files/.zshrc ~/.zshrc
cp ~/dot-files/.vimrc ~/.vim/vimrc

INSTALL_MINPAC=false

while getopts i opt;
do
	case $opt in
		i) INSTALL_MINPAC=true
	esac
done

if [[ "$INSTALL_MINPAC" == true ]]
then
	mkdir -p $VIMCONFIG/pack/minpac/opt
	cd $VIMCONFIG/pack/minpac/opt
	git clone https://github.com/k-takata/minpac.git
fi

