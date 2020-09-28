import Web3 from 'web3';
import address from 'blockchain/address.json'

export default class API {
    constructor() {
        this.CONTRACT_ADDRESS = 0;
        this.CONTRACT_ADDRESS = address.address
    }
    async getAccounts() {
        return window.ethereum.enable()
    }

    async getNumberOfCard(crt) {
        const totalCards = parseInt(await crt.methods.totalCards().call());
        return totalCards;
    }

    async getCardInfo(crt, id) {
        const info = await crt.methods.getCardInfo(id).call();
        return info;
    }

    async  getCards(crt) {
        const totalCards = parseInt(await crt.methods.totalCards().call())
        return totalCards;
    }

    async  getCardOwner(crt, id) {
        const cardOwner = await crt.methods.getCardOwner(id).call();
        return cardOwner;
    }

    async  makeSellable(crt, id) {
        let account = await this.getAccounts();
        const cardOwner = await crt.methods.makeSellable(id).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
        return cardOwner;
    }

    async  makeUnSellable(crt, id) {
        let account = await this.getAccounts();
        const cardOwner = await crt.methods.makeUnsellable(id).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
        return cardOwner;
    }

    async  makeOffer(crt, id, value) {
        let account = await this.getAccounts();
        await crt.methods.makeOffer(id, Web3.utils.toWei("" + value, "Gwei")).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
        return "Done";
    }

    async acceptOffer(crt, id, buyer) {
        let account = await this.getAccounts();
        await crt.methods.acceptOffer(id, buyer).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
        return "Done";
    }

    async acceptOfferExchange(crt, id, exchanger) {
        let account = await this.getAccounts();
        await crt.methods.acceptOfferExchange(id, exchanger).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
        return "Done";
    }

    async getPreviousOffer(crt, id) {
        let account = await this.getAccounts();
        const offers = await crt.methods.getPendingTrades(id, account[0]).call();
        return offers
    }

    async getPreviousOfferExchange(crt, id) {
        let account = await this.getAccounts();
        const offers = await crt.methods.getPendingExchange(id, account[0]).call();
        return offers
    }

    async  getOwnersToCard(crt) {
        let arrayToRetrun = [];
        let account = await this.getAccounts();
        const length = await crt.methods.getLengthOwnerToCard(account[0]).call();
        console.log(length)
        for (let i = 0; i < length; i++) {
            arrayToRetrun.push(await crt.methods.ownersToCard(account[0], i).call());
        }
        return arrayToRetrun;
    }

    async getNumberBuyer(crt, id) {
        const number = await crt.methods.getLengthListBuyer(id).call();
        return number
    }

    async getAddressBuyer(crt, cardID, index) {
        const buyer = await crt.methods.getAddressBuyer(cardID, index).call();
        return buyer;
    }

    async getNumberExchanger(crt, id) {
        const number = await crt.methods.getLengthListExchange(id).call();
        return number
    }

    async getAddressExhchange(crt, cardID, index) {
        const buyer = await crt.methods.getAddressExhchange(cardID, index).call();
        return buyer;
    }

    async makeOfferExchange(crt, idToGet, idToExchange) {
        let account = await this.getAccounts();
        await crt.methods.makeOfferExchange(idToGet, idToExchange).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "wei") });
    }


    async getListBuyerVal(crt, id, address) {
        const prop = await crt.methods.getListBuyerVal(id, address).call();
        return prop;
    }

    async getOffer(crt, id, buyer) {
        const offer = await crt.methods.getOffer(id, buyer).call();
        return offer
    }

    async getOfferExchange(crt, id, buyer) {
        const offer = await crt.methods.getOfferExchange(id, buyer).call();
        return offer
    }


    async  buyFromStore(crt, id, price) {
        let account = await this.getAccounts();
        let send = await crt.methods.buyCard(id).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("" + price, "wei") });
        return "Finished"
    }

    async buyCardFromPlayer(crt, id, price) {
        let account = await this.getAccounts();
        let send = await crt.methods.buyCardFromPlayer(id).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: price });
        return "Finished"
    }

    async  getPropOfCard(crt, cardId) {
        let properties = await crt.methods.getCardProp(cardId).call();
        return properties;
    }

    async startFight(crt, cardId1, cardId2) {
        let account = await this.getAccounts();
        await crt.methods.startFight(cardId1, cardId2).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }

    async createBulbasaur(crt) {
        let account = await this.getAccounts();
        await crt.methods.createBulbasaur().send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }

    async createCharamander(crt) {
        let account = await this.getAccounts();
        await crt.methods.createCharamander().send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }

    async createPidgey(crt) {
        let account = await this.getAccounts();
        await crt.methods.createPidgey().send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }

    async createSquirtle(crt) {
        let account = await this.getAccounts();
        await crt.methods.createSquirtle().send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }

    async getXP(crt, id) {
        let xp = await crt.methods.getXP(id).call();
        return xp;
    }

    async startBreeding(crt, parentA, parentB) {
        let account = await this.getAccounts();
        await crt.methods.startBreeding(parentA, parentB).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }

    async collectBreeding(crt, parentA, parentB) {
        let account = await this.getAccounts();
        await crt.methods.collectBreeding(parentA, parentB).send({ from: account[0], to: this.CONTRACT_ADDRESS, value: Web3.utils.toWei("0", "ether") });
    }


    async Froom_getPropertiesCard(crt, id) {
        let props = await crt.methods.getPropertiesCard(id).call();
        return props
    }

    async Froom_getCombatCard(crt, id) {
        let info = await crt.methods.getCombatCard(id).call();
        return info;
    }

    async Froom_getAlterations(crt, id) {
        let alt = await crt.methods.getAlterations(id).call();
        return alt;
    }

    async Froom_actionAttack(crt, froomAdd) {
        let account = await this.getAccounts();
        console.log(account)
        console.log(froomAdd)
        await crt.methods.actionAttack().send({ from: account[0], to: froomAdd, value: Web3.utils.toWei("0", "ether") },
            function (error, transactionHash) { console.log(error); console.log(transactionHash) });
    }

    async Froom_actionDefend(crt, froomAdd) {
        let account = await this.getAccounts();
        await crt.methods.actionDefend().send({ from: account[0], to: froomAdd, value: Web3.utils.toWei("0", "ether") });
    }



}