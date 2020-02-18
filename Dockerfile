FROM alpine:3.6

RUN apk add --no-cache --update \
    gcc \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    python3

ADD . /moto/
ENV PYTHONUNBUFFERED 1

WORKDIR /moto/
RUN  python3 -m ensurepip && \
     rm -r /usr/lib/python*/ensurepip && \
     pip3 --no-cache-dir install --upgrade pip setuptools && \
     pip3 --no-cache-dir install ".[server]" && \
     pip3 install PyJWT

ENTRYPOINT ["/usr/bin/moto_server", "-H", "0.0.0.0"]

EXPOSE 5000

# FROM python:2.7-alpine
  
# MAINTAINER picadoh
 
# RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev
# RUN pip install moto && pip install flask
# RUN pip install PyJWT
 
# VOLUME /opt/moto
 
# ADD start.sh .
# RUN chmod +x start.sh
 
# EXPOSE 5000
 
# ENTRYPOINT ./start.sh
