rm -r vim;
hg clone https://code.google.com/p/vim/;
cd vim;
hg update;
make distclean;
#./configure --with-features=huge \                                            
#            --enable-gnome-check \
#            --enable-gtk2-check \
#            --enable-gui=auto \
#            --enable-luainterp \
#            --enable-multibyte \
#            --enable-perlinterp \
#            --enable-python3interp \
#            --enable-pythoninterp \
#            --enable-rubyinterp \
#            --with-compiledby="Basti" \
#            --with-lua-prefix=/usr/local \
#            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
#            --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
#            --with-x \;
./configure \
   --enable-perlinterp \
   --enable-python3interp \
   --enable-pythoninterp \
   --enable-rubyinterp \
   --enable-cscope \
   --enable-gui=auto \
   --enable-gtk2-check \
   --enable-gnome-check \
   --with-features=huge \
   --enable-multibyte \
   --with-x \
   --with-compiledby="Basti" \
   --with-python3-config-dir=/usr/lib/python3.3/config-3.3m-x86_64-linux-gnu;
make;
sudo make install;

            
