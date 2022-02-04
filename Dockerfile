FROM python:3.8-slim-bullseye

USER root
RUN dpkg --add-architecture i386 && \
    apt-get update  && \
    apt-get install -y sudo wine wine32 libwine fonts-wine winbind --no-install-recommends && \
    wine --version && \
    rm -rf /var/lib/apt/lists/*  && \
    useradd --shell /bin/bash --home /mt4 xuser && \
    usermod -aG sudo xuser && \
    mkdir -p /mt4/input /mt4/output
WORKDIR /mt4
COPY sdk sdk
COPY compile.py .
COPY compile.sh .
COPY version.txt .
RUN /usr/bin/wine --version && \
    chown -R xuser:xuser /mt4 && chmod u+x /mt4/compile.sh
USER xuser
CMD [ "bash", "-ex", "compile.sh", "input" ]
# CMD [ "python", "/mt4/compile.py" ]
