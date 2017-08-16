version: '2'
services:
  btc-full-node:
    image: btc-full-node  # TODO: fix registry & tag
    environment:
      RPC_USER: ${RPC_USER}
      RPC_PASSWORD: "${RPC_PASSWORD}"
      ENABLE_TESTNET: "${ENABLE_TESTNET}"
      DEBUG: "${DEBUG}"
    tty: false
    stdin_open: false
      ports:
        {{- if eq .Values.ENABLE_TESTNET 1 }}
        - 18333:18333
        - 18332:18332
        {{- else }}
        - 8333:8333
        - 8332:8332
        {{- end }}
    volumes:
      - ${PATH_TO_STORAGE}:/home/btcd/.bitcoin
    labels:
      io.rancher.container.pull_image: always