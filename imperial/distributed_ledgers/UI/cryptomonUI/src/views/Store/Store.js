import React from "react";
// @material-ui/core
import { makeStyles } from "@material-ui/core/styles";
// core components
import GridContainer from "components/Grid/GridContainer.js";
import PokemonCardsBuy from "components/PokemonCardsBuy/PokemonCardsBuy";
import Web3 from 'web3';
import API from "blockchain/APIBlock.js"
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import crtInterface from 'interfaces/Cryptomons.json';




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
        this.generateCard(this.state.crt)


    }

    async generateCard(crt) {
        let ids = await this.state.api.getNumberOfCard(crt);
        let cards = {};
        for (let k = 0; k < ids; k++) {
            let infoCard = await this.state.api.getCardInfo(crt, k);
            if (infoCard.inStore && infoCard.isSellable) {
                let prop = await this.state.api.getPropOfCard(crt, k)
                cards[k] = {};
                cards[k]["prop"] = prop;
                cards[k]["price"] = infoCard.price
            }
        }
        let cardToGenerate = []

        for (const el in cards) {
            cardToGenerate.push(
                <PokemonCardsBuy species={cards[el].prop.species}
                    id={el} price={cards[el].price} prop={cards[el].prop} />
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
