import React from "react";
// @material-ui/core
import { makeStyles } from "@material-ui/core/styles";
// core components
import GridContainer from "components/Grid/GridContainer.js";
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import PokemonCards from "components/PokemonCards/PokemonCards";
import Web3 from 'web3';
import API from "blockchain/APIBlock.js"

import crtInterface from 'interfaces/Cryptomons.json';
import fightRoomInterface from 'interfaces/FightRoom.json';





export default class MyCards extends React.PureComponent {
    constructor(props) {
        super(props); // typ hp attack lvl def xp
        let api = new API();
        let webb = new Web3(window.ethereum)
        let acc = api.getAccounts();
        const useStyles = makeStyles(styles);
        this.state = {
            api: api,
            useStyles: useStyles,
            web3s: webb,
            account: acc,
            crt: new webb.eth.Contract(crtInterface, api.CONTRACT_ADDRESS, { from: acc[0] }),
            todisplay: null
        }
        this.generateCard(this.state.crt, this.state.useStyles)


    }

    async generateCard(crt, classes) {
        let ids = await this.state.api.getOwnersToCard(crt);
        let cards = {};
        for (let k = 0; k < ids.length; k++) {
            let infoCard = await this.state.api.getCardInfo(crt, ids[k]);
            let prop = await this.state.api.getPropOfCard(crt, ids[k])

            cards[ids[k]] = {};
            cards[ids[k]]["prop"] = prop;
            cards[ids[k]]["isSellable"] = infoCard.isSellable
            cards[ids[k]]["inStore"] = infoCard.inStore
            cards[ids[k]]["id"] = infoCard._id
            cards[ids[k]]["price"] = infoCard.price;
            cards[ids[k]]["ListBuyer"] = []
            cards[ids[k]]["ListExchanger"] = []
            cards[ids[k]]["breedsWith"] = infoCard.breedsWith;
            cards[ids[k]]["canCollect"] = ((infoCard.timebreed < Math.round((new Date()).getTime() / 1000)) && !infoCard.breedCollected);
            cards[ids[k]]["disableButton"] = infoCard.isBreeding || infoCard.isFighting;

            let numberOfBuyer = await this.state.api.getNumberBuyer(crt, ids[k])
            for (let i = 0; i < numberOfBuyer; i++) {
                let buyer = await this.state.api.getAddressBuyer(crt, ids[k], i);
                let topush = await this.state.api.getOffer(crt, ids[k], buyer);
                let hasAcc = await this.state.api.getListBuyerVal(crt, ids[k], buyer);
                topush["hasAcc"] = hasAcc;
                topush["buyer"] = buyer;
                cards[ids[k]]["ListBuyer"].push(topush);
            }

            let numberOfExchanger = await this.state.api.getNumberExchanger(crt, ids[k])

            for (let i = 0; i < numberOfExchanger; i++) {
                let exchanger = await this.state.api.getAddressExhchange(crt, ids[k], i);
                let topush = await this.state.api.getOfferExchange(crt, ids[k], exchanger);
                topush["exchanger"] = exchanger;
                topush["prop"] = await this.state.api.getPropOfCard(crt, topush.card)
                cards[ids[k]]["ListExchanger"].push(topush);
            }

        }

        let cardToGenerate = []
        for (const el in cards) {
            cardToGenerate.push(
                <PokemonCards species={cards[el].prop.species} prop={cards[el].prop} canCollect={cards[el].canCollect}
                    disableButton={cards[el].disableButton}
                    _id={cards[el].id} listbuyer={cards[el]["ListBuyer"]} listexchanger={cards[el]["ListExchanger"]} price={cards[el].price}
                    isSellable={cards[el].isSellable} inStore={cards[el].inStore} breedsWith={cards[el].breedsWith} />
            )
        }

        this.setState({ todisplay: cardToGenerate })
        return cardToGenerate;

    }
    render() {
        return (<div>
            <GridContainer>
                {this.state.todisplay === null ? <div>Loading... </div> : this.state.todisplay}
            </GridContainer>
        </div>);
    }
}
