FROM debian:stable as build_lib
RUN apt-get update                                                   \
    && apt-get install -y git build-essential                        \
    && git clone https://github.com/wolfcw/libfaketime /libfaketime  \
    && cd /libfaketime                                               \
    && make                                                          \
    && make install

FROM scratch
COPY --from=build_lib /usr/local/lib/faketime/libfaketimeMT.so.1 /faketime.so
