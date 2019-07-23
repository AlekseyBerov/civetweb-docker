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
grep -rl "PREFIX" *.cmake | xargs sed -i 's,"/usr/local","/tmp/artifacts/civet-pkg/usr",g';

cmake -P cmake_install.cmake;
cd /tmp/artifacts;

mkdir civet-pkg/etc
tee -a civet-pkg/etc/civetweb.conf << END
document_root /var/www
END


mkdir -p civet-pkg/var/www;
tee -a civet-pkg/var/www/index.html << END
<html>
<title>CivetWeb docker image, how about that</title>
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

ls -la civet-pkg;
dpkg-deb --build civet-pkg;





