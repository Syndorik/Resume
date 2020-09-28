# Cryptomons

## How to run the game

### Pre-requisites

***Installation of Node:***
```sh
sudo apt-get update
sudo apt-get install nodejs npm
```

***Installation of ganache-cli:***
```sh
sudo apt-get update
sudo npm install -g ganache-cli
```

***Installation of Truffle:***
```sh
npm install -g truffle
```

### Run the backend
***Start network:***
```sh
ganache-cli --allowUnlimitedContractSize  --gasLimit 0xFFFFFFFFFFFF -i 1234
```

***Migrate the contracts:***
```sh
cd ./smart_contract/Cryptomons
truffle migrate --reset
```

### Run the UI
***Install metamask extension***

***Copy paste the seed phrase to link metamask to the network***

***Install dependencies***
```sh
npm install
```

***Start node server***
```sh
cd UI/cryptomonUI
npm start
```

After that, the UI should be running connected to the private blockchain.
You should see on metamask 10 accounts with 100 ETHER.
You should be able to see 8 pokemons in the Store tab on the UI.
---

## List of Directories

`spec-467-1-0.pdf`: Specs of the coursework

`report.pdf`: Reports dealing with how the project was done

### UI/cryptomonUI: 
Contains all the files needed to run the UI.
The UI was inspired by https://www.creative-tim.com/product/material-dashboard-react
This was done with ReactJS

`src`: Contains all the views and the code developped for this UI

`src/assets`: GIFs, photos and others media

`src/blockchain`: API to communicate with the blockchain

`src/components`: React components used in views

`src/interfaces`: Interfaces with contract deployed on the Blockchain

`src/views`: React views

`index.js`: Root element

`routes.js`: Routing of the UI
---

### smart_contract/Cryptomons: 
Contains all the backend (hence logic) of pokemon game.
This simulates a private network, and migrate the contracts onto it.

`build/contracts`: Build files of the contract

`contracts`: Contracts created for the pokemon game

`migrations`: Migrations scripts

`truffle-config.js`: Blockchain private network's configuration

### videos
This folder contains videos of the UI, and the main possible interractions with it.

