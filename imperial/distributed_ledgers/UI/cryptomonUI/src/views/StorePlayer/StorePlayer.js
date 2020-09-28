import React from "react";
// @material-ui/core
import { makeStyles } from "@material-ui/core/styles";
// core components
import GridContainer from "components/Grid/GridContainer.js";
import Web3 from 'web3';
import API from "blockchain/APIBlock.js"
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import crtInterface from 'interfaces/Cryptomons.json';
import PokemonPlayer from "components/PokemonCardsBuyPlayer/PokemonCardsBuyPlayer.js"



const useStyles = makeStyles(styles)


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
            todisplay: null,
            buybutt: null,
        }
        this.generateCard(this.state.crt, this.state.useStyles)


    }

    async generateCard(crt, classes) {
        let ids = await this.state.api.getNumberOfCard(crt);
        let cards = {};
        for (let k = 0; k < ids; k++) {
            let infoCard = await this.state.api.getCardInfo(crt, k);
            let account = await this.state.account
            if (!infoCard.inStore && infoCard.isSellable && !infoCard.isBreeding && infoCard.owner.toLowerCase() != account[0].toLowerCase()) {
                let prop = await this.state.api.getPropOfCard(crt, k);
                let prevOffer = await this.state.api.getPreviousOffer(crt, k);
                cards[k] = {};
                cards[k]["offerValue"] = prevOffer.value;
                cards[k]["isInTrade"] = prevOffer.isInTrade;
                cards[k]["prop"] = prop;
                cards[k]["_id"] = infoCard._id
                cards[k]["price"] = infoCard.price

                let hasAcc = await this.state.api.getListBuyerVal(crt, k, account[0]);
                cards[k]["hasAcc"] = hasAcc;
                cards[k]["buyer"] = account[0];
            }
        }
        let cardToGenerate = []

        for (const el in cards) {
            cardToGenerate.push(
                <PokemonPlayer offerValue={cards[el].offerValue} isInTrade={cards[el].isInTrade} buyer={cards[el].buyer}
                    _id={cards[el]._id} price={cards[el].price} hasAcc={cards[el].hasAcc}
                    prop={cards[el].prop} species={cards[el].prop.species} />
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
