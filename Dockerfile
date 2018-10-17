FROM elixir:1.7.2

RUN echo "BUIDLING BLOCKSCOUT"

## INITIAL UPDATES
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y

## NODE
RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

## GIT
RUN apt-get install git-core -y

## POSTGRES
RUN apt-get update
RUN apt-get install postgresql postgresql-contrib -y

## PHOENIX
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

## BlockScout
RUN git clone https://github.com/poanetwork/blockscout

WORKDIR blockscout

## BlockScout Config
RUN cp apps/explorer/config/dev.secret.exs.example apps/explorer/config/dev.secret.exs
RUN cp apps/block_scout_web/config/dev.secret.exs.example apps/block_scout_web/config/dev.secret.exs
RUN cp apps/explorer/config/test.secret.exs.example apps/explorer/config/test.secret.exs

## Install BlockScout dependencies
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix do deps.get --force,local.rebar --force, deps.compile, compile

## install npm/node stuff
RUN cd apps/block_scout_web/assets && npm install
RUN cd apps/explorer && npm install

## install config
ADD dev.exs /blockscout/apps/explorer/config/dev.exs
ADD dev.secret.exs /blockscout/apps/explorer/config/dev.secret.exs

COPY docker-entrypoint.sh /usr/local/bin/
CMD ["docker-entrypoint.sh"]
