FROM ubuntu:16.04

ADD cmaker.sh /usr/src/cmaker.sh

CMD ["/bin/bash"]
ENTRYPOINT ["/usr/src/cmaker.sh"]

