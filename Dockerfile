FROM trenpixster/elixir


# RUN apt-get update && apt-get install rsyslogd
WORKDIR /app
COPY . /app

RUN mix local.hex
RUN mix deps.get --only prod
CMD PORT=4001 MIX_ENV=prod mix phx.server
