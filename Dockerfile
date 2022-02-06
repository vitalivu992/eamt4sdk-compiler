FROM python:3.8-slim-bullseye

RUN dpkg --add-architecture i386 && \
    apt-get update  && \
    apt-get install -y sudo wine wine32 libwine fonts-wine winbind --no-install-recommends && \
    wine --version && \
    rm -rf /var/lib/apt/lists/*  && \
    mkdir -p /mt4/input /mt4/output
WORKDIR /mt4
COPY sdk sdk
COPY compile.py .
CMD [ "python", "/mt4/compile.py" ]
