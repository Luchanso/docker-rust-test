FROM rust:1.72.0 as builder

WORKDIR /usr/src/app

RUN rustup target add x86_64-unknown-linux-musl

# ENV RUSTFLAGS="-C target-feature=+crt-static"

COPY Cargo.toml Cargo.lock ./

# For Cache layer, but not working with bugs
# RUN \
#     mkdir ./src && \
#     echo 'fn main() {}' > ./src/main.rs && \
#     cargo build --target x86_64-unknown-linux-musl --release && \
#     rm -Rvf ./src

COPY src src
RUN cargo build --target x86_64-unknown-linux-musl --release

FROM scratch

COPY --from=builder /usr/src/app/target/x86_64-unknown-linux-musl/release/docker-test /usr/local/bin/docker-test

CMD ["docker-test"]