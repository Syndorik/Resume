import React from "react";

import CardBody from "components/Card/CardBody.js";
import CardFooter from "components/Card/CardFooter.js";
import Card from "components/Card/Card.js";
import Grid from "@material-ui/core/Grid"
import GridItem from "components/Grid/GridItem.js";
import { makeStyles } from "@material-ui/core/styles";
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import Button from "@material-ui/core/Button";
import PokemonStats from "components/PokemonStats/PokemonStats"
import API from "blockchain/APIBlock.js"
import Web3 from 'web3';
import crtInterface from 'interfaces/Cryptomons.json';

import SquirGif from "assets/img/pokemons/squirtle.gif"
import WaterType from "assets/img/pokemons/typeWater.png"
import PidgGif from "assets/img/pokemons/pidgey.gif"
import AirType from "assets/img/pokemons/typeAir.png"
import CharGif from "assets/img/pokemons/charmander.gif"
import FireType from "assets/img/pokemons/typeFire.png"
import BulbGif from "assets/img/pokemons/bulbasaur.gif"
import PoisonType from "assets/img/pokemons/typePlant.png"


const useStyles = makeStyles(styles)
const PokemonCardsBuy = (props) => {
    const classes = useStyles();
    let api = new API();
    let webb = new Web3(window.ethereum)
    let acc = api.getAccounts();
    let crt = new webb.eth.Contract(crtInterface, api.CONTRACT_ADDRESS, { from: acc[0] })

    let pokeGif = "";
    let pokeType = "";

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
        <Grid container>
            <Grid item xs={3}>
            </Grid>
            <Grid item xs={6}>
                <Card className={classes.cardheight}>
                    <CardBody className={classes.centerAlign}>
                        <img className={classes.fitImage} src={pokeGif} alt="charmander" />
                    </CardBody>
                    <CardFooter chart className={classes.centerAlign} >
                        <img src={pokeType} style={{ "width": "30%" }} alt="charmander" />
                        <PokemonStats prop={props.prop} />
                    </CardFooter>
                </Card>
            </Grid>
            <Grid item xs={3}>
            </Grid>
        </Grid>

    );
}

export default PokemonCardsBuy;