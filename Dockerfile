FROM ubuntu:20.04

USER root
RUN dpkg --add-architecture i386 && \
    ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime && echo Etc/UTC > /etc/timezone && \
    apt-get update  && \
    apt-get install -y tzdata sudo vim && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y wine wine32 --no-install-recommends && \
    wine --version && \
    rm -rf /var/lib/apt/lists/*  && \
    adduser --shell /bin/bash --home /mt4 xuser && \
    mkdir -p /mt4/output /mt4/src

WORKDIR /mt4
COPY sdk sdk
COPY compile.sh .

RUN chown -R xuser:xuser /mt4
VOLUME [ "/mt4/source", "/mt4/output" ]

USER xuser
CMD [ "/bin/bash", "/mt4/compile.sh" ]
