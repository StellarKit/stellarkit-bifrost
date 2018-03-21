## Stellar Bifrost

### The simplest and cleanest Docker image for running bifrost

Build and run:

    docker-compose build
    docker-compose up -d

Defaults to testnet.

Creates a folder 'stellar' in your home folder.  Everything is stored there, delete it to reset.

### Edit docker-compose.yml for your setup

You'll need to edit the docker-compose.yml files to change environment vars to match your setup:

    MASTER_PUBLIC_KEY:                 "xpub6C79eBsW2XQbzfXFsRv51Lac6Ckx5nyqf9cUmFr1fuAEHGXmpq8oPNMqCpH1jTdwP3s5SD644R8KK4cVytk9Jxcxcb7JsfNxcGNRbG5q4pq"
    BIFROST_STELLAR_ISSUER_PUBLIC_KEY: "GDBTRP7XKRJ5PZJ25O3FLAHFMTQOSUWLSNZCOEEAR73TWDZENODNGDCS"
    BIFROST_STELLAR_SIGNER_SECRET_KEY: "SCW6UIBPNI5IQI55DGIAPCYDFNF7RWX4DYTTC253XNQ7LTPZASKXQIPI"
    TOKEN_ASSET_CODE:                  "LMB"
    NETWORK_ID:                        "4"

NETWORK_ID defaults to Rinkeby testnet (4)

3 = Ropsten testnet
1 = live Ethereum network)

Pull requests welcome!

### Donations

If you like this code, a [`donation`](https://stellarkit.io/#/donate) would be appreciated.

    XLM: GBJC6AF4I5FUTYMG4CXC3V2NYMIQANBRB4UQYY3M2RRZCXCNLFR7TN7J
