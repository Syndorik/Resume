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
import PokemonCardsSimple from "components/PokemonCardsSimple/PokemonCardsSimple.js"

import SquirGif from "assets/img/pokemons/squirtle.gif"
import WaterType from "assets/img/pokemons/typeWater.png"
import PidgGif from "assets/img/pokemons/pidgey.gif"
import AirType from "assets/img/pokemons/typeAir.png"
import CharGif from "assets/img/pokemons/charmander.gif"
import FireType from "assets/img/pokemons/typeFire.png"
import BulbGif from "assets/img/pokemons/bulbasaur.gif"
import PoisonType from "assets/img/pokemons/typePlant.png"
import CardHeader from "components/Card/CardHeader";

import { Dialog, DialogTitle, DialogActions, DialogContent, Grid, Tooltip, IconButton } from "@material-ui/core";
import InfoIcon from '@material-ui/icons/Info';

const useStyles = makeStyles(styles)

const ExchangeButton = (props) => {
    const classes = useStyles();
    let mcolor = "primary"
    return (
        <Button variant="contained" color={mcolor} style={{ "width": "80%" }} onClick={() => { props.exchangeCallBack(props._id) }}>
            {props.selectExhange ? "Select Pokemon" : "Make offer"}
        </Button>
    );
}


const ExchangeInformation = (props) => {
    const classes = useStyles();

    return (
        <Dialog onClose={props.handleClose} aria-labelledby="customized-dialog-title" open={props.open} maxWidth={"md"} fullWidth={true}>
            <DialogTitle id="customized-dialog-title" onClose={props.handleClose}>
                Exchange Information
                </DialogTitle>
            <DialogContent dividers>
                <PokemonCardsSimple prop={props.prev_prop} species={props.prev_spec} />
            </DialogContent>
            <DialogActions>
                <Button autoFocus onClick={props.handleClose} color="primary">
                    CLOSE
                    </Button>
            </DialogActions>
        </Dialog>
    )
}


const Header = (props) => {
    const classes = useStyles();

    const [open, setOpen] = React.useState(false);


    const handleClickOpen = () => {
        setOpen(true);
    };
    const handleClose = () => {
        setOpen(false);
    };

    return (
        <CardHeader>
            <Grid container direction="row" justify="center" alignItems="center">
                <Grid item xs={2}>
                </Grid>
                <Grid item xs={8}>
                    <span className={classes.pokemonFont}> PREVIOUS OFFER</span>
                </Grid>
                <Grid item xs={2}>
                    <Tooltip title="Information">
                        <IconButton onClick={handleClickOpen}>
                            <InfoIcon fontSize={"large"} />
                        </IconButton>
                    </Tooltip>
                </Grid>
            </Grid>
            <ExchangeInformation handleClose={handleClose} open={open} prev_prop={props.prev_prop} prev_spec={props.prev_spec} />
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
    const headerIfOffer = <Header api={api} crt={crt} _id={props._id} prev_prop={props.prev_prop} prev_spec={props.prev_spec} />

    if (!props.selectExhange) {
        headerToDisplay = headerIfOffer
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
                    props.isInExchange ? headerToDisplay : ""
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
                            <ExchangeButton _id={props.id} exchangeCallBack={props.exchangeCallBack} selectExhange={props.selectExhange} />
                        </GridItem>
                    </GridContainer>
                </CardFooter>
            </Card>
        </GridItem>
    );
}


export default PokemonPlayer;