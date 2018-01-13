 ## Stellar Bifrost  

### The simplest and cleanest Docker image for running bifrost

Build and run:
```
docker-compose build
docker-compose up -d
```

Defaults to testnet.

You'll need to edit the docker-compose.yml files to change environment vars to match your setup:
MASTER_PUBLIC_KEY, BIFROST_STELLAR_ISSUER_PUBLIC_KEY, BIFROST_STELLAR_SIGNER_SECRET_KEY, TOKEN_ASSET_CODE

Edit docker-compose.yml for mainnet

Pull requests welcome!
