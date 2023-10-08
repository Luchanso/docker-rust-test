FROM rust:1.72.0 as builder

WORKDIR /usr/src/app

COPY . .
RUN cargo build -r

FROM debian:bookworm

# RUN apt install libc
COPY --from=builder /usr/src/app/target/release/docker-test /usr/local/bin/docker-test
CMD ["docker-test"]