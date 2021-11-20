FROM ubuntu:20.04

USER root
RUN dpkg --add-architecture i386 \
    && apt-get update

RUN apt-get install -y --no-install-recommends wine \
    && wine --version

# icmarkets-mt4sdk\metaeditor.exe /compile:"MQL4\Experts\FocusPanel.mq4" /include:MQL4 /log:x.log

RUN useradd -ms /bin/bash oriole \
    && mkdir -p /home/oriole/mql4 /home/oriole/logs /home/oriole/build
USER oriole
ENV HOME /home/oriole
ENV WINEPREFIX /home/oriole/.wine
ENV WINEARCH win32
WORKDIR /home/oriole
COPY compile.sh .
COPY mt4sdk .

VOLUME [ "/home/oriole/mql4", "/home/oriole/logs", "/home/oriole/build" ]
ENTRYPOINT ["/bin/bash"]
CMD ["compile.sh"]