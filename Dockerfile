FROM haskell:8.8.1
RUN cabal update
RUN cabal install scotty github --lib
WORKDIR /app
COPY . /app
ENTRYPOINT ["runghc", "server.hs"]
