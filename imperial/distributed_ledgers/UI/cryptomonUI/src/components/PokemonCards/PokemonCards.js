import React from "react";

import CardBody from "components/Card/CardBody.js";
import CardFooter from "components/Card/CardFooter.js";
import Card from "components/Card/Card.js";
import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";
import { makeStyles } from "@material-ui/core/styles";
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";
import Button from "@material-ui/core/Button";
import API from "blockchain/APIBlock.js"
import Web3 from 'web3';
import crtInterface from 'interfaces/Cryptomons.json';
import CardHeader from "components/Card/CardHeader";
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import Divider from "@material-ui/core/Divider"
import MaterialTable from 'material-table';
import Grid from "@material-ui/core/Grid"
import PokemonStats from "components/PokemonStats/PokemonStats.js"
import PokemonCardsSimple from "components/PokemonCardsSimple/PokemonCardsSimple.js"
import InfoIcon from '@material-ui/icons/Info';
import IconButton from "@material-ui/core/IconButton"

import Tooltip from "@material-ui/core/Tooltip"

import SquirGif from "assets/img/pokemons/squirtle.gif"
import WaterType from "assets/img/pokemons/typeWater.png"
import PidgGif from "assets/img/pokemons/pidgey.gif"
import AirType from "assets/img/pokemons/typeAir.png"
import CharGif from "assets/img/pokemons/charmander.gif"
import FireType from "assets/img/pokemons/typeFire.png"
import BulbGif from "assets/img/pokemons/bulbasaur.gif"
import PoisonType from "assets/img/pokemons/typePlant.png"


import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';

function TabPanel(props) {
    const { children, value, index, ...other } = props;

    return (
        <Typography
            component="div"
            role="tabpanel"
            hidden={value !== index}
            id={`simple-tabpanel-${index}`}
            aria-labelledby={`simple-tab-${index}`}
            {...other}
        >
            {value === index && <Box p={3}>{children}</Box>}
        </Typography>
    );
}



const PutOnSaleButton = (props) => {
    const classes = useStyles();
    let towrite = 'Put on sale';
    let mcolor = 'primary'

    if (props.isSellable) {
        towrite = 'Remove from sales'
        mcolor = 'secondary'
    }

    let getChoice = async () => {
        if (props.isSellable) {
            await props.api.makeUnSellable(props.crt, props._id);
        } else {
            await props.api.makeSellable(props.crt, props._id);
        }
    }

    return (
        <Tooltip title="Your pokemon is either breeding or fighting" disableFocusListener={!props.disableButton} disableHoverListener={!props.disableButton} disableTouchListener={!props.disableButton}>
            <span>
                <Button variant="contained" disabled={props.disableButton} color={mcolor} style={{ "width": "80%" }} onClick={() => { getChoice().then(() => { window.location.reload() }) }}>
                    {towrite}
                </Button>
            </span>
        </Tooltip>

    );
}

const CollectBreeding = (props) => {
    const classes = useStyles();
    let towrite = 'Collect Breeding';
    let mcolor = 'primary'


    let collectBreeding = async () => {
        await props.api.collectBreeding(props.crt, props._id, props.breedsWith);
    }

    return (
        <Button variant="contained" color={mcolor} style={{ "width": "80%", "backgroundColor": "#df68f5" }} onClick={() => { collectBreeding().then(() => { window.location.reload() }) }}>
            {towrite}
        </Button>
    );
}

const Offers = (props) => {

    const acceptTrade = async (id, buyer) => {
        await props.api.acceptOffer(props.crt, id, buyer)
    }
    return (
        <MaterialTable
            title="List of Offers"
            columns={[
                { title: 'Address', field: 'address' },
                { title: 'Offer in ETH', field: 'offer' },
                { title: 'Trade Accepted', field: 'tradeAccepted' }
            ]}
            data={props.data}
            actions={[
                {
                    icon: 'checkicon',
                    tooltip: 'Confirm Offer',
                    onClick: ((event, rowData) => { acceptTrade(props._id, rowData.address).then(() => window.location.reload()) })
                }
            ]}
        />
    )
}

const Exchange = (props) => {

    const acceptTrade = async (id, buyer) => {
        await props.api.acceptOfferExchange(props.crt, id, buyer)
    }

    console.log(props.data)
    return (
        <MaterialTable
            title="List of Offers"
            columns={[
                { title: 'Address', field: 'address' },
                { title: 'Offer', field: 'offer' },
            ]}
            data={props.data}
            actions={[
                {
                    icon: 'checkicon',
                    tooltip: 'Confirm Offer',
                    onClick: ((event, rowData) => { acceptTrade(props._id, rowData.address).then(() => window.location.reload()) })
                }
            ]}
        />
    )
}

const PersonalisedHeader = (props) => {
    const classes = useStyles();
    const [open, setOpen] = React.useState(false);
    const [value, setValue] = React.useState(0);

    const handleChange = (event, newValue) => {
        setValue(newValue);
    };

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    return (
        <CardHeader>
            <Tooltip title="Your pokemon is either breeding or fighting" disableFocusListener={!props.disableButton} disableHoverListener={!props.disableButton} disableTouchListener={!props.disableButton}>
                <span>
                    <Button variant="outlined" color="secondary" disabled={props.disableButton} onClick={handleClickOpen} style={{ "width": "80%" }}>
                        Check Offers
            </Button>
                </span>
            </Tooltip>
            <Dialog
                fullWidth={"md"}
                maxWidth={"md"}
                open={open}
                onClose={handleClose}
                aria-labelledby="max-width-dialog-title"
            >
                <DialogTitle id="max-width-dialog-title">Offers on this Pokemon</DialogTitle>
                <DialogContent>
                    <DialogContentText>
                        <Tabs value={value} onChange={handleChange} aria-label="simple tabs example">
                            <Tab label="Priced Offers" />
                            <Tab label="Exchange Offers" />
                        </Tabs>
                        <TabPanel value={value} index={0}>
                            {props.offers}
                        </TabPanel>
                        <TabPanel value={value} index={1}>
                            {props.exchanges}
                        </TabPanel>
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose} color="secondary">
                        Close
                </Button>
                </DialogActions>
            </Dialog>
        </CardHeader>
    )
}

const useStyles = makeStyles(styles)

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


const Ex = (props) => {
    const classes = useStyles();

    const [open, setOpen] = React.useState(false);


    const handleClickOpen = () => {
        setOpen(true);
    };
    const handleClose = () => {
        setOpen(false);
    };

    return (
        <div>
            <Tooltip title="Information">
                <IconButton onClick={handleClickOpen}>
                    <InfoIcon fontSize={"large"} />
                </IconButton>
            </Tooltip>
            <ExchangeInformation handleClose={handleClose} open={open} prev_prop={props.prev_prop} prev_spec={props.prev_spec} />
        </div>
    )

}


const PokemonCards = (props) => {
    const classes = useStyles();
    const [state, setState] = React.useState({
        columns: [
            { title: 'Address Buyer', field: 'address' },
            { title: 'Offer', field: 'offer' },
        ],
    });

    let api = new API();
    let webb = new Web3(window.ethereum)
    let acc = api.getAccounts();
    let crt = new webb.eth.Contract(crtInterface, api.CONTRACT_ADDRESS, { from: acc[0] })
    let moffers = [];
    let mexchanges = [];
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



    for (const k in props.listbuyer) {
        if (props.listbuyer[k].isOffer) {
            let towrite = "---"
            if ((props.listbuyer[k].hasAcc.acceptedBuyer == props.listbuyer[k].buyer) && (props.price == props.listbuyer[k].value)) {
                towrite = "Waiting for Trade"
            }
            let top = { address: props.listbuyer[k].buyer, offer: props.listbuyer[k].value / 10e17, tradeAccepted: towrite }
            moffers.push(top)
        }
    }


    for (const i in props.listexchanger) {
        if (props.listexchanger[i].isOffer) {
            let ex = <Ex prev_prop={props.listexchanger[i].prop} prev_spec={props.listexchanger[i].prop.species} />
            let top = { address: props.listexchanger[i].exchanger, offer: ex }
            mexchanges.push(top)
        }
    }

    let offers = <Offers crt={crt} api={api} _id={props._id} data={moffers} />
    let exchanges = <Exchange crt={crt} api={api} _id={props._id} data={mexchanges} />


    const headerToDisplay = <PersonalisedHeader offers={offers} exchanges={exchanges} disableButton={props.disableButton} />
    const collect = <Grid item xs={12} style={{ marginTop: "10px" }}>
        <CollectBreeding _id={props._id} breedsWith={props.breedsWith} crt={crt} api={api} />
    </Grid>;

    return (
        <GridItem xs={12} sm={12} md={3}>
            <Card className={classes.cardheight}>
                {headerToDisplay}
                <Divider />
                <CardBody className={classes.centerAlign}>
                    <img className={classes.fitImage} src={pokeGif} alt="charmander" />
                </CardBody>
                <CardFooter chart className={classes.centerAlign} >
                    <img src={pokeType} style={{ "width": "30%" }} alt="charmander" />
                    <PokemonStats prop={props.prop} />
                    <GridContainer >
                        <Grid item xs={12}>
                            <PutOnSaleButton disableButton={props.disableButton} _id={props._id} isSellable={props.isSellable} inStore={props.inStore} crt={crt} api={api} />
                        </Grid>
                        {props.canCollect ? collect : ""}

                    </GridContainer>
                </CardFooter>
            </Card>
        </GridItem>
    );
}

export default PokemonCards;