FROM crystallang/crystal:latest
ADD . /src
WORKDIR /src
RUN crystal build --release src/megadecrypter.cr
#RUN crystal run ./support/list-deps.cr -- /src/megadecrypter

FROM scratch
COPY --from=0 /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.1.0.0
COPY --from=0 /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.1.0.0
COPY --from=0 /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/libpcre.so.3
COPY --from=0 /lib/x86_64-linux-gnu/libpcre.so.3.13.2 /lib/x86_64-linux-gnu/libpcre.so.3.13.2
COPY --from=0 /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=0 /lib/x86_64-linux-gnu/libpthread-2.23.so /lib/x86_64-linux-gnu/libpthread-2.23.so
COPY --from=0 /usr/lib/x86_64-linux-gnu/libevent-2.0.so.5 /usr/lib/x86_64-linux-gnu/libevent-2.0.so.5
COPY --from=0 /usr/lib/x86_64-linux-gnu/libevent-2.0.so.5.1.9 /usr/lib/x86_64-linux-gnu/libevent-2.0.so.5.1.9
COPY --from=0 /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2
COPY --from=0 /lib/x86_64-linux-gnu/libdl-2.23.so /lib/x86_64-linux-gnu/libdl-2.23.so
COPY --from=0 /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/libgcc_s.so.1
COPY --from=0 /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=0 /lib/x86_64-linux-gnu/libc-2.23.so /lib/x86_64-linux-gnu/libc-2.23.so
COPY --from=0 /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=0 /lib/x86_64-linux-gnu/ld-2.23.so /lib/x86_64-linux-gnu/ld-2.23.so
COPY --from=0 /src/megadecrypter /app/megadecrypter
ENTRYPOINT ["/app/megadecrypter"]
