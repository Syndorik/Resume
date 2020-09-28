import React from "react";
// @material-ui/core
import { makeStyles } from "@material-ui/core/styles";
// core components
import GridContainer from "components/Grid/GridContainer.js";
import PokemonFroom from "components/PokemonCardsFightingRoom/PokemonCardsFightingRoom.js";
import Web3 from 'web3';
import API from "blockchain/APIBlock.js"
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import crtInterface from 'interfaces/Cryptomons.json';
import fightRoomInterface from 'interfaces/FightRoom.json';
import Slide from '@material-ui/core/Slide';

import GridItem from "components/Grid/GridItem.js"
import Paper from '@material-ui/core/Paper';
import ArrowBackIcon from '@material-ui/icons/ArrowBack';
import IconButton from '@material-ui/core/IconButton';



const useStyles = makeStyles(styles)



class MyCards extends React.PureComponent {
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
        }
        this.generateCard(this.state.crt, this.state.useStyles)


    }


    async generateCard(crt, classes) {
        let ids = await this.state.api.getNumberOfCard(crt);
        let cards = {};
        let account = await this.state.account
        for (let k = 0; k < ids; k++) {
            let infoCard = await this.state.api.getCardInfo(crt, k);
            if ((infoCard.isFighting) && (infoCard.owner.toLowerCase() == account[0].toLowerCase())) {
                cards[k] = {};
                cards[k]["crtfr"] = new this.state.web3s.eth.Contract(fightRoomInterface, infoCard.fightRoom)
                cards[k]["froomAdd"] = infoCard.fightRoom;
                cards[k]["prop"] = await this.state.api.Froom_getPropertiesCard(cards[k]["crtfr"], k);
                cards[k]["alterations"] = await this.state.api.Froom_getAlterations(cards[k]["crtfr"], k);
                cards[k]["infoCard"] = await this.state.api.Froom_getCombatCard(cards[k]["crtfr"], k);
                let o_id = cards[k]["infoCard"].otherFight;


                cards[k]["o_prop"] = await this.state.api.Froom_getPropertiesCard(cards[k]["crtfr"], o_id);
                cards[k]["o_alterations"] = await this.state.api.Froom_getAlterations(cards[k]["crtfr"], o_id);

                cards[k]["prop"]["xp"] = await this.state.api.getXP(crt, k);
                cards[k]["price"] = infoCard.price
                cards[k]["oid"] = o_id
            }
        }
        let cardToGenerate = []

        for (const el in cards) {
            cardToGenerate.push(
                <PokemonFroom frt={cards[el].crtfr} froomAdd={cards[el].froomAdd} wait={cards[el].infoCard.waiting}
                    species={cards[el].prop.species} o_species={cards[el].o_prop.species}
                    m_alterations={cards[el].alterations} o_cardprop={cards[el].o_prop} o_alterations={cards[el].o_alterations}
                    id={el} oid={cards[el].oid} price={cards[el].price} m_cardprop={cards[el].prop} />
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



export default function SimpleSlide(props) {
    const classes = useStyles();

    return (
        <div>
            <div>
                <div style={{ "textAlign": "center" }}>
                    <Paper elevation={3} className={classes.addPadding}>
                        <span style={{ "fontSize": "30px", "fontWeight": "bold" }}>
                            SELECT A POKEMON TO START/CONTINUE A FIGHT</span>
                    </Paper>
                </div>
            </div>
            <div>
                <MyCards />
            </div>
        </div>

    );
}
