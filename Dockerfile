FROM debian:jessie

MAINTAINER Platzhalter <platzhalter@sigaint.org>

ADD https://github.com/anope/anope/releases/download/2.0.3/anope-2.0.3-source.tar.gz /src/

RUN apt-get update && apt-get -y install cmake g++
WORKDIR /src
RUN tar -xvf anope-*-source.tar.gz
RUN mv `ls -d anope-*-source` anope
WORKDIR anope
RUN printf "/anope\n\n\n\n\ny\n\n\n\n" | ./Config -nocache -nointro
WORKDIR build
RUN make && make install
RUN mkdir /db
RUN touch /db/anope.db
RUN ln -s /db/anope.db /anope/data/anope.db

VOLUME ["/anope/conf", "/db"]

ENTRYPOINT ["/anope/bin/services"]
CMD ["--nofork"]
