wget https://github.com/carrot2/carrot2/releases/download/release%2F4.2.1/carrot2-4.2.1.zip
unzip -o carrot2-4.2.1.zip -d carrot2
rm carrot2-4.2.1.zip
chgrp -R p2n carrot2*
chmod -R 755 ./carrot2/carrot2-4.2.1/dcs/dcs
mv ./carrot2/carrot2-4.2.1/dcs/dcs ./carrot2/carrot2-4.2.1/dcs/dcs.sh



