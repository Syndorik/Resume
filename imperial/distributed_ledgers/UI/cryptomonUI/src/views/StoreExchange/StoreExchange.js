import React from "react";
// @material-ui/core
import { makeStyles } from "@material-ui/core/styles";
// core components
import GridContainer from "components/Grid/GridContainer.js";
import PokemonCardsExchange from "components/PokemonCardsExchange/PokemonCardsExchange.js";
import Web3 from 'web3';
import API from "blockchain/APIBlock.js"
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import crtInterface from 'interfaces/Cryptomons.json';
import Slide from '@material-ui/core/Slide';

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
            buybutt: null,
            selectedPokemon: null,
        }
        this.generateCard(this.state.crt, this.state.useStyles)


    }

    exchangeCallBack = (idSelected) => {
        this.state.selectedPokemon = idSelected;
        this.props.callback(idSelected);
    }

    async generateCard(crt, classes) {
        let ids = await this.state.api.getNumberOfCard(crt);
        let cards = {};
        let account = await this.state.account
        for (let k = 0; k < ids; k++) {
            let infoCard = await this.state.api.getCardInfo(crt, k);
            if ((!infoCard.isFighting) && (!infoCard.isBreeding) && (!infoCard.inStore) && (infoCard.owner.toLowerCase() == account[0].toLowerCase())) {
                let prop = await this.state.api.getPropOfCard(crt, k)
                cards[k] = {};
                cards[k]["prop"] = prop;
                cards[k]["price"] = infoCard.price
            }
        }
        let cardToGenerate = []

        for (const el in cards) {
            cardToGenerate.push(
                <PokemonCardsExchange exchangeCallBack={this.exchangeCallBack} selectExhange={true}
                    id={el} prop={cards[el].prop} species={cards[el].prop.species} />
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


class SelectFighter extends React.PureComponent {
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
            fighter1: this.props.idSelected
        }
        this.generateCard(this.state.crt, this.state.useStyles)


    }

    exchangeCallBack = (idSelected) => {
        console.log(idSelected)
        this.state.api.makeOfferExchange(this.state.crt, idSelected, this.props.exchanger1).then(
            () => {
                window.location.reload();
            }
        );

    }

    async generateCard(crt, classes) {
        let ids = await this.state.api.getNumberOfCard(crt);
        let cards = {};
        let account = await this.state.account
        for (let k = 0; k < ids; k++) {
            let infoCard = await this.state.api.getCardInfo(crt, k);
            if ((!infoCard.isFighting) && (infoCard.owner.toLowerCase() != account[0].toLowerCase()) && (!infoCard.isBreeding) && (!infoCard.inStore)) {
                let prop = await this.state.api.getPropOfCard(crt, k)
                let prevOffer = await this.state.api.getPreviousOfferExchange(crt, k);
                cards[k] = {};
                cards[k]["prop"] = prop;
                cards[k]["isInExchange"] = prevOffer.isInExchange;
                cards[k]["offer"] = prevOffer.card
                cards[k]["prev_prop"] = await this.state.api.getPropOfCard(crt, prevOffer.card)
                cards[k]["prev_spec"] = cards[k]["prev_prop"].species
            }
        }
        let cardToGenerate = []

        for (const el in cards) {
            cardToGenerate.push(
                <PokemonCardsExchange exchangeCallBack={this.exchangeCallBack} selectExhange={false} offer={cards[el].offer}
                    id={el} prop={cards[el].prop} species={cards[el].prop.species} isInExchange={cards[el].isInExchange}
                    prev_prop={cards[el].prev_prop} prev_spec={cards[el].prev_spec} />
            )
        }
        if (cardToGenerate.length == 0) {
            cardToGenerate.push(<div>There is no pokemon available for fighting. Come back later</div>)
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
    const [checked, setChecked] = React.useState(false);
    const [idSelected, setIdSelected] = React.useState(-1);
    const classes = useStyles();
    let callbackChange = (id) => {
        setChecked(prev => !prev)
        setIdSelected(id);
    }

    return (<div>
        <Slide direction="left" in={checked} mountOnEnter unmountOnExit>
            <div>

                <div style={{ "textAlign": "center" }}>
                    <Paper elevation={3} className={classes.addPadding}>
                        <IconButton className={classes.positionleft} onClick={() => { callbackChange(null) }}>
                            <ArrowBackIcon size="large" />
                        </IconButton>

                        <span className={classes.titlefight}>
                            SELECT A POKEMON TO EXCHANGE</span>
                    </Paper>
                </div>
                <div>
                    <SelectFighter exchanger1={idSelected} selectFighter={false} />
                </div>
            </div>
        </Slide>
        <Slide direction="right" in={!checked} mountOnEnter unmountOnExit >
            <div>
                <div>
                    <div style={{ "textAlign": "center" }}>
                        <Paper elevation={3} className={classes.addPadding}>
                            <span style={{ "fontSize": "30px", "fontWeight": "bold" }}>
                                SELECT ONE OF YOUR POKEMON</span>
                        </Paper>
                    </div>
                </div>
                <div>
                    <MyCards callback={callbackChange} selectFighter={true} />
                </div>
            </div>

        </Slide>
    </div>

    );
}
