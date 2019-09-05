
FROM python:3.7-buster
COPY tensorflow-2.0.0b1-cp37-cp37m-linux_x86_64.whl ./
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
				build-essential  libhdf5-dev \
				 g++ python3-dev \
 && pip install cython \
RUN git clone git://sourceware.org/git/glibc.git \
 && cd glibc \
 && git checkout master \
 && ./configure \
 && make \
 && make install \
 && echo "TODO : manque peut etre symlink autre que LD_library_path" \
 && pip install ./tensorflow-2.0.0b1-cp37-cp37m-linux_x86_64.whl \
 && apt-get clean \
 && rm -rf /tmp/* /var/tmp/*

RUN LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/glibc/lib
