
FROM python:3.7-alpine
COPY tensorflow-2.0.0b1-cp37-cp37m-linux_x86_64.whl ./
RUN apk add --no-cache --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted hdf5-dev
RUN apk add --no-cache --virtual .build-deps build-base g++ musl-dev python3-dev \
 && pip install cython \
 && pip install ./tensorflow-2.0.0b1-cp37-cp37m-linux_x86_64.whl \
 && apk del .build-deps
