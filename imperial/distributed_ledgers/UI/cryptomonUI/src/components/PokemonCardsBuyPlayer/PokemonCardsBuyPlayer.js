import React from "react";

import CardBody from "components/Card/CardBody.js";
import CardFooter from "components/Card/CardFooter.js";
import Card from "components/Card/Card.js";
import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";
import { makeStyles } from "@material-ui/core/styles";
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import Button from "@material-ui/core/Button";
import Divider from "@material-ui/core/Divider"
import TextField from "@material-ui/core/TextField";
import API from "blockchain/APIBlock.js"
import Web3 from 'web3';
import crtInterface from 'interfaces/Cryptomons.json';
import PokemonStats from "components/PokemonStats/PokemonStats.js"

import SquirGif from "assets/img/pokemons/squirtle.gif"
import WaterType from "assets/img/pokemons/typeWater.png"
import PidgGif from "assets/img/pokemons/pidgey.gif"
import AirType from "assets/img/pokemons/typeAir.png"
import CharGif from "assets/img/pokemons/charmander.gif"
import FireType from "assets/img/pokemons/typeFire.png"
import BulbGif from "assets/img/pokemons/bulbasaur.gif"
import PoisonType from "assets/img/pokemons/typePlant.png"
import CardHeader from "components/Card/CardHeader";

const useStyles = makeStyles(styles)


class PutOnSaleButton extends React.PureComponent {
    constructor(props) {
        super(props)
        let api = props.api;

        let towrite = 'Make Offer';
        let mcolor = 'primary';

        if (props.isInTrade) {
            towrite = 'Make Another Offer'
            mcolor = 'secondary'
        }

        this.state = {
            api: api,
            crt: props.crt,
            towrite: towrite,
            mcolor: mcolor,
            valueToGive: 0,
            open: false,
        }
    }



    async takeTheOffer() {
        await this.state.api.makeOffer(this.state.crt, this.props._id, this.state.valueToGive)
        this.state.open = true
    }


    handleOnChange(e) {
        this.state.valueToGive = e.target.value;
    }

    render() {
        return (
            <div>
                <TextField required onChange={(e) => { this.handleOnChange(e) }}
                    style={{ "padding-bottom": "10px" }} id="priceOffer" label="Price in GWEI" type="number" defaultValue="0" />
                <Button variant="contained" color={this.state.mcolor} style={{ "width": "80%" }}
                    onClick={() => { this.takeTheOffer().then(() => { window.location.reload() }) }}>
                    {this.state.towrite}
                </Button>
            </div >
        )
    }
}

const HeaderNoOffer = (props) => {
    const classes = useStyles();

    return (
        <CardHeader>
            <span className={classes.pokemonFont}> PREVIOUS OFFER : {props.offerValue / (10e17)} ETHER</span>
        </CardHeader>
    )
}

const HeaderIfOffer = (props) => {
    let buyCard = async () => {
        await props.api.buyCardFromPlayer(props.crt, props._id, props.price);
    }
    return (
        <CardHeader>
            <Button variant="contained" style={{ "background-color": "rgb(52, 189, 63)", "color": "white", "width": "80%" }}
                onClick={() => { buyCard().then(() => { window.location.reload() }) }}>
                BUY FOR {props.offerValue / (10e17) + " ETHER"}
            </Button>
        </CardHeader>
    )
}

const PokemonPlayer = (props) => {
    const classes = useStyles();


    let api = new API();
    let webb = new Web3(window.ethereum)
    let acc = api.getAccounts();
    let crt = new webb.eth.Contract(crtInterface, api.CONTRACT_ADDRESS, { from: acc[0] });
    let pokeGif = "";
    let pokeType = "";

    let headerToDisplay = "";
    const headerNoOffer = <HeaderNoOffer offerValue={props.offerValue} />
    const headerIfOffer = <HeaderIfOffer api={api} crt={crt} _id={props._id} price={props.price} offerValue={props.offerValue} />

    if ((props.hasAcc.acceptedBuyer.toLowerCase() == props.buyer.toLowerCase()) && (props.price == props.offerValue)) {
        headerToDisplay = headerIfOffer;
    } else {
        headerToDisplay = headerNoOffer;
    }

    if (props.species == 0) {
        pokeGif = BulbGif;
        pokeType = PoisonType;
    } else if (props.species == 1) {
        pokeGif = CharGif;
        pokeType = FireType;
    } else if (props.species == 2) {
        pokeGif = SquirGif;
        pokeType = WaterType;
    } else if (props.species == 3) {
        pokeGif = PidgGif;
        pokeType = AirType;
    }



    return (
        <GridItem xs={12} sm={12} md={3}>
            <Card className={classes.cardheight}>
                {
                    props.isInTrade ? headerToDisplay : ""
                }
                <Divider />
                <CardBody className={classes.centerAlign}>
                    <img className={classes.fitImage} src={pokeGif} alt="charmander" />
                </CardBody>
                <CardFooter chart className={classes.centerAlign} >
                    <img src={pokeType} style={{ "width": "30%" }} alt="charmander" />
                    <PokemonStats prop={props.prop} />
                    <GridContainer >
                        <GridItem xs={12} sm={12} md={12}>
                            <PutOnSaleButton _id={props._id} isInTrade={props.isInTrade} inStore={props.inStore} api={api} crt={crt} />
                        </GridItem>
                    </GridContainer>
                </CardFooter>
            </Card>
        </GridItem>
    );
}

export default PokemonPlayer;