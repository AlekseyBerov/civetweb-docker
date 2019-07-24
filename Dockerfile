FROM ubuntu:16.04 as builder

ADD scripts/cmaker.sh /usr/src/cmaker.sh

RUN /usr/src/cmaker.sh


FROM ubuntu:16.04

COPY --from=builder /usr/src/civet-pkg.deb /root/civet-pkg.deb
RUN dpkg -i /root/civet-pkg.deb

EXPOSE 8080
ENTRYPOINT ["civetweb", "/etc/civetweb.conf"]
