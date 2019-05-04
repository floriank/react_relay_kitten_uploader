FROM bitwalker/alpine-elixir:1.8.1

RUN mkdir -p /opt/app && \
    chmod -R 777 /opt/app && \
    apk --no-cache --update add \
    nodejs yarn inotify-tools libressl libressl-dev zlib zlib-dev

# Copy the watchman executable binary directly from our image:
COPY --from=icalialabs/watchman:4-alpine3.4 /usr/local/bin/watchman* /usr/local/bin/

# Create the watchman STATEDIR directory:
RUN mkdir -p /usr/local/var/run/watchman \
 && touch /usr/local/var/run/watchman/.not-empty

# Don't do this at home
RUN ln -s /lib/libcrypto.so.1.1 /lib/libcrypto.so.1.0.0

ENV MIX_HOME=/opt/mix \
    HEX_HOME=/opt/hex \
    HOME=/opt/app

# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/app

ENV PORT 4000

ONBUILD COPY . .

EXPOSE ${PORT}

CMD ["mix", "do", "deps.get", ",", "phx.server"]
