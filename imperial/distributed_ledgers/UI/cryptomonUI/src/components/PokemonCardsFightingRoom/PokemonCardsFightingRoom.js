import React from "react";

import CardBody from "components/Card/CardBody.js";
import CardFooter from "components/Card/CardFooter.js";
import Card from "components/Card/Card.js";
import CardHeader from "components/Card/CardHeader.js"
import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";
import { makeStyles } from "@material-ui/core/styles";
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import Button from "@material-ui/core/Button";
import Tooltip from "@material-ui/core/Tooltip"
import API from "blockchain/APIBlock.js"
import Web3 from 'web3';
import crtInterface from 'interfaces/Cryptomons.json';
import fightRoomInterface from 'interfaces/FightRoom.json';
import Divider from "@material-ui/core/Divider"
import InfoIcon from '@material-ui/icons/Info';
import IconButton from "@material-ui/core/IconButton"
import Grid from "@material-ui/core/Grid"

import Dialog from '@material-ui/core/Dialog';
import DialogTitle from '@material-ui/core/DialogTitle';
import DialogContent from '@material-ui/core/DialogContent';
import DialogActions from '@material-ui/core/DialogActions';
import Typography from '@material-ui/core/Typography';
import ArrowForwardIosIcon from '@material-ui/icons/ArrowForwardIos';
import LinearProgress from '@material-ui/core/LinearProgress';

import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import CloseIcon from '@material-ui/icons/Close';
import Slide from '@material-ui/core/Slide';
import PokemonStats from "components/PokemonStats/PokemonStats.js"

import BgImgFight from "assets/img/fightbg.jpg"

import SquirGif from "assets/img/pokemons/squirtle.gif"
import WaterType from "assets/img/pokemons/typeWater.png"
import PidgGif from "assets/img/pokemons/pidgey.gif"
import AirType from "assets/img/pokemons/typeAir.png"
import CharGif from "assets/img/pokemons/charmander.gif"
import FireType from "assets/img/pokemons/typeFire.png"
import BulbGif from "assets/img/pokemons/bulbasaur.gif"
import PoisonType from "assets/img/pokemons/typePlant.png"

const useStyles = makeStyles(styles)

const CombatButton = (props) => {
    const classes = useStyles();
    return (
        <Button variant="contained" color="primary" style={{ "width": "80%" }} onClick={() => { props.openFroomCallBack() }}>
            ENTER FIGHTROOM
        </Button>
    );
}

const Transition = React.forwardRef(function Transition(props, ref) {
    return <Slide direction="up" ref={ref} {...props} />;
});

const FigthButton = (props) => {
    const classes = useStyles();
    const [arrow, setArrow] = React.useState(false)

    const onMouseOver = () => {
        setArrow(true)
    }

    const onMouseOut = () => {
        setArrow(false)
    }

    const toGenerate = (
        <span className={classes.pokemonFontFight} style={{ "color": props.isDisabled ? "grey" : "black" }}>
            {props.text}
        </span>
    )

    return (
        <Button disabled={props.isDisabled} onMouseOver={onMouseOver} onMouseOut={onMouseOut} onClick={props.onClickCallBack}
            style={{ "width": "100%" }}>
            <Grid container>
                <Grid item xs={4} className={classes.arrowgame}>
                    {arrow ? <ArrowForwardIosIcon /> : ""}
                </Grid>
                <Grid item xs={4}>
                    {toGenerate}
                </Grid>
                <Grid item xs={4}>
                </Grid>
            </Grid>
        </Button>
    )
}


function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

let HPbox = (props) => {
    const classes = useStyles();

    return (
        <div className={classes.hpBar} style={{ padding: "5px", margin: "20px" }}>
            <Grid container>
                <Grid item xs={12}>

                </Grid>
                <Grid item xs={4}>
                    <span className={classes.pokemonFont} style={{ "margin": "10px" }}>HP:</span>
                </Grid>
                <Grid item xs={8} style={{ display: "flex", "justifyContent": "center", "alignItems": "center", "padding-right": "10px" }}>
                    <LinearProgress variant="determinate" value={props.hp / props.maxhp * 100} style={{ height: "10px", width: "100%" }} />
                </Grid>
                <Grid item xs={4}>
                    <span className={classes.pokemonFont} style={{ "margin-bottom": "10px", "margin-left": "10px" }}>{props.pokeName}</span>
                </Grid>
                <Grid item xs={8} style={{ display: "flex", "justifyContent": "flex-end", "alignItems": "center", "padding-right": "10px" }}>
                    <span className={classes.pokemonFont} style={{ "margin-bottom": "10px" }}>{props.hp}/{props.maxhp}</span>
                </Grid>
            </Grid>
        </div>
    )
}

const FightR = (props) => {
    const classes = useStyles();
    const [open, setOpen] = React.useState(false);
    const [imageClassMine, setImageClassMine] = React.useState(classes.fitImageMine);
    const [hp, setHp] = React.useState(props.m_cardprop.hp);
    const [o_hp, setoHp] = React.useState(props.o_cardprop.hp);
    const [wait, setWait] = React.useState(props.wait);

    const handleClickOpen = () => {
        setOpen(true);
    };
    const handleClose = () => {
        setOpen(false);
    };


    let animateAttack = async () => {
        await props.api.Froom_actionAttack(props.frt, props.froomAdd);
        let nmhp = await props.api.Froom_getPropertiesCard(props.frt, props.id);
        let nohp = await props.api.Froom_getPropertiesCard(props.frt, props.oid);
        setImageClassMine(classes.fitImageMineAttack)
        await sleep(1500);
        setHp(nmhp.hp);
        setoHp(nohp.hp);
        setWait(!wait);
        await sleep(1500);
        setImageClassMine(classes.fitImageMine)


    }

    let animateDefense = async () => {
        await props.api.Froom_actionDefend(props.frt, props.froomAdd);
        let nmhp = await props.api.Froom_getPropertiesCard(props.frt, props.id);
        let nohp = await props.api.Froom_getPropertiesCard(props.frt, props.oid);
        setImageClassMine(classes.fitImageMineDefense)
        await sleep(1500);
        setHp(nmhp.hp);
        setoHp(nohp.hp);
        setWait(!wait);
        await sleep(1500);
        setImageClassMine(classes.fitImageMine)
    }

    const handleAttack = () => {
        animateAttack();
    }

    const handleDefense = () => {
        animateDefense();
    }

    const handlefClose = () => {
        props.closeFroomCallBack()
    };

    console.log(props.wait)

    return (
        <Dialog fullScreen open={props.fopen} onClose={handlefClose} TransitionComponent={Transition}>
            <Grid container style={{ height: "100%" }}>
                <Grid item xs={12} style={{ height: "5%" }}>
                    <AppBar className={classes.appBar}>
                        <Toolbar>
                            <IconButton edge="start" color="inherit" onClick={handlefClose} aria-label="close">
                                <CloseIcon />
                            </IconButton>
                            <Typography variant="h6" className={classes.title}>
                                FIGHTING ROOM
                    </Typography>
                        </Toolbar>
                    </AppBar>
                </Grid>
                <Grid item xs={12} style={{ height: "95%" }}>
                    <Grid container className={classes.upcontainer}>
                        <Grid item xs={12} sm={2} ></Grid>
                        <Grid item xs={12} sm={8} className={classes.containerFight} style={{ 'backgroundImage': "url(" + BgImgFight + ")", "backgroundSize": "100% 100%", "backgroundRepeat": "no-repeat" }}>
                            <Grid container className={classes.upcontainer} justify={"center"} alignItems={"center"}>
                                <Grid item xs={12} sm={12} style={{ height: "35%" }}></Grid>
                                <Grid item xs={12} sm={6} style={{ height: "25%", "justifyContent": "flex-start", "alignItems": "flex-start", "display": "flex" }}>
                                    <HPbox hp={o_hp} maxhp={props.o_cardprop.maxhp} pokeName={props.o_pokeName} />
                                </Grid>
                                <Grid item xs={12} sm={6} style={{ "textAlign": "center", height: "25%" }}><img className={classes.fitImageOp} src={props.o_pokeGif} alt="charmander" /></Grid>

                                <Grid item xs={12} sm={5} style={{ "textAlign": "center", "transform": "scaleX(-1)", height: "36%" }}><img className={imageClassMine} src={props.pokeGif} alt="charmander" /></Grid>
                                <Grid item xs={12} sm={7} style={{ height: "35%", "justifyContent": "flex-end", "alignItems": "flex-end", "display": "flex" }}>
                                    <HPbox hp={hp} maxhp={props.m_cardprop.maxhp} pokeName={props.pokeName} />
                                </Grid>
                                <Grid item xs={12} sm={12} style={{ height: "10%" }}></Grid>
                            </Grid>
                        </Grid>
                        <Grid item xs={12} sm={2}></Grid>


                        <Grid item xs={12} sm={2}></Grid>
                        <Grid item xs={12} sm={8} className={classes.selectAction} >
                            <Grid container justify={"center"} alignItems={"center"} style={{ height: "100%" }}>
                                <Grid item xs={12} sm={6} className={classes.flexCentre} style={{ height: "50%" }}>
                                    <FigthButton text={"ATTACK"} onClickCallBack={handleAttack} isDisabled={wait} />
                                </Grid>

                                <Grid item xs={12} sm={6} className={classes.flexCentre} style={{ height: "50%" }}>
                                    <FigthButton text={"DEFENSE"} onClickCallBack={handleDefense} isDisabled={wait} />
                                </Grid>

                                <Grid item xs={12} sm={4} style={{ height: "50%" }}></Grid>

                                <Grid item xs={12} sm={4} className={classes.flexCentre} style={{ height: "50%" }}>
                                    <FigthButton text={"MORE INFO"} onClickCallBack={handleClickOpen} isDisabled={false} />
                                </Grid>
                                <Grid item xs={12} sm={4} style={{ height: "50%" }}></Grid>
                            </Grid>
                        </Grid>
                        <Grid item xs={12} sm={2}></Grid>

                    </Grid>
                </Grid>
            </Grid>
            <FightInformation handleClose={handleClose} open={open} m_cardprop={props.m_cardprop} o_cardprop={props.o_cardprop} m_alterations={props.m_alterations} o_alterations={props.o_alterations} />
        </Dialog>
    )
}

const InfoFight = (props) => {
    const classes = useStyles();
    return (
        <Grid container direction='column' justify="center" alignItems="center" xs={5} className={classes.scd}>

            <Card className={classes.scd}>
                <CardHeader style={{ "textAlign": "center" }}>
                    <span className={classes.pokemonFont}> {props.header} </span>
                    <Divider flexItem={true} />
                </CardHeader>
                <CardBody>
                    <Grid container direction="row" justify="center" alignItems="left" className={classes.twoRoundCard} style={{ "margin": "20px 0px 20px 0px" }}>
                        <Grid item xs={12} className={{ [classes.centerAlign]: true, [classes.onlyBottom]: true }}>
                            STATS
                        </Grid>
                        <Grid item xs={1}></Grid>
                        <Grid item xs={10} sm={1}></Grid>
                        <Grid item xs={10} sm={3}>
                            <span >HP : {props.prop.maxhp}</span>
                        </Grid>
                        <Grid item xs={10} sm={3}>
                            <span>DEF. : {props.prop.def}</span>
                        </Grid>
                        <Grid item xs={10} sm={3}>
                            <span>ATK. : {props.prop.attack}</span>
                        </Grid>
                        <Grid item xs={1}></Grid>


                        <Grid item xs={1}></Grid>
                        <Grid item xs={10} sm={1}></Grid>
                        <Grid item xs={10} sm={3}>
                            <span>LVL : {props.prop.lvl}</span>
                        </Grid>
                        <Grid item xs={10} sm={3}>
                            <Tooltip title="Chance of dodging attack"><span>DOD. : {props.prop.dodgeChance}</span></Tooltip>
                        </Grid>
                        <Grid item xs={10} sm={3}>
                            <Tooltip title="Chance of critical attack"><span>CRT. : {props.prop.bonusCritic}</span></Tooltip>
                        </Grid>
                        <Grid item xs={1}></Grid>
                    </Grid>
                    <Grid container direction="row" justify="center" alignItems="left" className={classes.BottomRoundCard} style={{ "margin": "20px 0px 20px 0px" }}>
                        <Grid item xs={12} className={{ [classes.centerAlign]: true, [classes.onlyBottom]: true }}>
                            ALTERATIONS, TURNS REMAING
                    </Grid>
                        <Grid item xs={1}></Grid>
                        <Grid item xs={10} sm={1}></Grid>
                        <Grid item xs={10} sm={3}>
                            <Tooltip title="Defense: Increase DOD.">
                                <span> DEF. : {props.atlerations.turnDefRemaining} </span>
                            </Tooltip>
                        </Grid>
                        <Grid item xs={10} sm={3}>
                            <Tooltip title="Fire: High tick damage">
                                <span> FIR. : {props.atlerations.turnFireRemaing} </span>
                            </Tooltip>
                        </Grid>
                        <Grid item xs={10} sm={3}>
                            <Tooltip title="Poison: Low tick damage">
                                <span> PSN. : {props.atlerations.turnPoisonRemaining} </span>
                            </Tooltip>
                        </Grid>
                        <Grid item xs={1}></Grid>
                        <Grid item xs={3}></Grid>
                        <Grid item xs={3} className={classes.centerAlign}>
                            <Tooltip title="Water: Opponent CRIT. increased">
                                <span> WAT. : {props.atlerations.turnSoakedRemaining} </span>
                            </Tooltip>
                        </Grid>
                        <Grid item xs={3} className={classes.centerAlign}>
                            <Tooltip title="Air: Opponent DOD. increased">
                                <span> AIR : {props.atlerations.turnAirRemaining} </span>
                            </Tooltip>
                        </Grid>
                        <Grid item xs={3}></Grid>
                    </Grid>
                </CardBody>
            </Card>
        </Grid>
    )
}

const FightInformation = (props) => {
    const classes = useStyles();

    return (
        <Dialog onClose={props.handleClose} aria-labelledby="customized-dialog-title" open={props.open} maxWidth={"md"} fullWidth={true}>
            <DialogTitle id="customized-dialog-title" onClose={props.handleClose}>
                Fight Information
                </DialogTitle>
            <DialogContent dividers>
                <Grid container direction="row" justify="center" alignItems="center">
                    <InfoFight prop={props.m_cardprop} atlerations={props.m_alterations} header={"YOUR POKEMON INFO"} />

                    <InfoFight prop={props.o_cardprop} atlerations={props.o_alterations} header={"OPPONENT INFO"} />
                </Grid>
            </DialogContent>
            <DialogActions>
                <Button autoFocus onClick={props.handleClose} color="primary">
                    CLOSE
                    </Button>
            </DialogActions>
        </Dialog>
    )
}

const PokemonFroom = (props) => {
    const classes = useStyles();
    const [open, setOpen] = React.useState(false);
    const [fopen, setfOpen] = React.useState(false);

    let api = new API();
    let frt = props.frt;

    let pokeGif = "";
    let pokeType = "";
    let pokeName = "";

    let o_pokeGif = "";
    let o_pokeType = "";
    let o_pokeName = "";

    if (props.species == 0) {
        pokeGif = BulbGif;
        pokeType = PoisonType;
        pokeName = "BULBASAUR";
    } else if (props.species == 1) {
        pokeGif = CharGif;
        pokeType = FireType;
        pokeName = "CHARMANDER";
    } else if (props.species == 2) {
        pokeGif = SquirGif;
        pokeType = WaterType;
        pokeName = "SQUIRTLE";
    } else if (props.species == 3) {
        pokeGif = PidgGif;
        pokeType = AirType;
        pokeName = "PIDGEY";
    }

    if (props.o_species == 0) {
        o_pokeGif = BulbGif;
        o_pokeType = PoisonType;
        o_pokeName = "BULBASAUR";
    } else if (props.o_species == 1) {
        o_pokeGif = CharGif;
        o_pokeType = FireType;
        o_pokeName = "CHARMANDER";
    } else if (props.o_species == 2) {
        o_pokeGif = SquirGif;
        o_pokeType = WaterType;
        o_pokeName = "SQUIRTLE";
    } else if (props.o_species == 3) {
        o_pokeGif = PidgGif;
        o_pokeType = AirType;
        o_pokeName = "PIDGEY";
    }




    const handleClickOpen = () => {
        setOpen(true);
    };
    const handleClose = () => {
        setOpen(false);
    };

    let openFroomCallBack = () => {
        setfOpen(true);
    }

    let closeFroomCallBack = () => {
        setfOpen(false);
    }

    return (
        <GridItem xs={12} sm={12} md={3} >
            <Card className={classes.cardheight}>
                <CardHeader>
                    <Grid container direction="row" justify="center" alignItems="center">
                        <Grid item xs={2}>
                        </Grid>
                        <Grid item xs={8}>
                            <span className={classes.pokemonFont}> REMAINING HP : {props.m_cardprop.hp}</span>
                        </Grid>
                        <Grid item xs={2}>
                            <Tooltip title="Information">
                                <IconButton onClick={handleClickOpen}>
                                    <InfoIcon fontSize={"large"} />
                                </IconButton>
                            </Tooltip>
                        </Grid>
                    </Grid>
                </CardHeader>
                <Divider />
                <CardBody className={classes.centerAlign}>
                    <img className={classes.fitImage} src={pokeGif} alt="charmander" />
                </CardBody>
                <CardFooter chart className={classes.centerAlign} >
                    <img src={pokeType} style={{ "width": "30%" }} alt="charmander" />
                    <PokemonStats prop={props.m_cardprop} />
                    <GridContainer >
                        <GridItem xs={12} sm={12} md={12}>
                            <CombatButton openFroomCallBack={openFroomCallBack} />
                        </GridItem>
                    </GridContainer>
                </CardFooter>
            </Card>


            <FightInformation handleClose={handleClose} open={open}
                m_cardprop={props.m_cardprop} o_cardprop={props.o_cardprop} m_alterations={props.m_alterations} o_alterations={props.o_alterations} />


            <FightR id={props.id} oid={props.oid} pokeName={pokeName} o_pokeName={o_pokeName} frt={frt} api={api} froomAdd={props.froomAdd} wait={props.wait}
                o_pokeGif={o_pokeGif} fopen={fopen} pokeGif={pokeGif} closeFroomCallBack={closeFroomCallBack}
                m_cardprop={props.m_cardprop} o_cardprop={props.o_cardprop} m_alterations={props.m_alterations} o_alterations={props.o_alterations} />

        </GridItem>
    );
}

export default PokemonFroom;