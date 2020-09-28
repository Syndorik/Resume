import React from "react";

import CardBody from "components/Card/CardBody.js";
import CardFooter from "components/Card/CardFooter.js";
import Card from "components/Card/Card.js";
import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";
import { makeStyles } from "@material-ui/core/styles";
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import Button from "@material-ui/core/Button";
import PokemonStats from "components/PokemonStats/PokemonStats.js"
import Grid from "@material-ui/core/Grid"

import SquirGif from "assets/img/pokemons/squirtle.gif"
import WaterType from "assets/img/pokemons/typeWater.png"
import PidgGif from "assets/img/pokemons/pidgey.gif"
import AirType from "assets/img/pokemons/typeAir.png"
import CharGif from "assets/img/pokemons/charmander.gif"
import FireType from "assets/img/pokemons/typeFire.png"
import BulbGif from "assets/img/pokemons/bulbasaur.gif"
import PoisonType from "assets/img/pokemons/typePlant.png"



const CombatButton = (props) => {
    const classes = useStyles();
    let mcolor = props.selectFighter ? "primary" : "secondary"
    return (
        <Button variant="contained" color={mcolor} style={{ "width": "80%" }} onClick={() => { props.combatCallBack(props.id) }}>
            {props.selectFighter ? "SELECT FOR COMBAT" : "START FIGHT"}
        </Button>
    );
}


const useStyles = makeStyles(styles)
const PokeStartFight = (props) => {
    const classes = useStyles();
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
        <GridItem xs={12} sm={12} md={3}>
            <Card className={classes.cardheight}>
                <CardBody className={classes.centerAlign}>
                    <img className={classes.fitImage} src={pokeGif} alt="charmander" />
                </CardBody>
                <CardFooter chart className={classes.centerAlign} >
                    <img src={pokeType} style={{ "width": "30%" }} alt="charmander" />
                    <PokemonStats prop={props.prop} />
                    <GridContainer >
                        <GridItem xs={12} sm={12} md={12}>
                            <CombatButton id={props.id} combatCallBack={props.combatCallBack} selectFighter={props.selectFighter} />
                        </GridItem>
                    </GridContainer>
                </CardFooter>
            </Card>
        </GridItem>
    );
}

export default PokeStartFight;