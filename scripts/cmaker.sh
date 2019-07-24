#!/bin/bash

apt-get update && apt-get install -y build-essential \
    sudo \
    cmake \
    clang \
    wget \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/artifacts/* /var/tmp/*;


git clone https://github.com/civetweb/civetweb;
git checkout v1.11;

cd civetweb; 
bash build;

cd output/build; 
grep -rl "PREFIX" *.cmake | xargs sed -i 's,"/usr/local","/usr/src/civet-pkg/usr",g';
cmake -P cmake_install.cmake;

cd /usr/src;

mkdir civet-pkg/etc
tee -a civet-pkg/etc/civetweb.conf << END
document_root /var/www/civet
END

mkdir -p civet-pkg/var/www/civet;
tee -a civet-pkg/var/www/civet/index.html << END
<html>
  <title>CivetWeb</title>
    <body>

      <h2> some clear message </h2>

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





