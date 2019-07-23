#!/bin/bash

echo "Nyan cat";
apt-get update && apt-get install -y build-essential \
    sudo \
    cmake \
    clang \
    wget \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/outcome/* /var/tmp/*;


git clone https://github.com/civetweb/civetweb;
git checkout v1.11;

cd civetweb; bash build;

cd output/build; ls -la;
grep -rl "PREFIX" *.cmake | xargs sed -i 's,"/usr/local","/tmp/outcome/civet-pkg/usr",g';

cmake -P cmake_install.cmake;
cd /tmp/outcome;

mkdir -p civet-pkg/var/www;
tee -a civet-pkg/var/www/index.html << END
<html>
<title>CivetWeb docker image, how about that</title>
<body>
<img src="https://tenor.com/view/stickers-pusheen-nyan-cat-gif-3532525"></img>
</body>
</html>
END

mkdir civet-pkg/DEBIAN;

tee -a civet-pkg/DEBIAN/control << END
Package: civetweb-brv
Version: 1.12
Architecture: amd64
Maintainer: Aleksey Berov <krusual@live.com>
Description: Civetweb
END

dpkg-deb --build civet-pkg;





