
import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Grid from "@material-ui/core/Grid"
import styles from "assets/jss/material-dashboard-react/views/dashboardStyle.js";

const useStyles = makeStyles(styles)

export default (props) => {
    const classes = useStyles();
    return (
        <Grid container justify="center" alignItems="flex-start">
            <Grid item xs={1}></Grid>
            <Grid item xs={1}></Grid>
            <Grid item xs={10} sm={5} className={classes.gridItem}>
                <span className={classes.pokemonFont}> HP : {props.prop.maxhp ? props.prop.maxhp : props.prop.hp}</span>
            </Grid>
            <Grid item xs={10} sm={5} className={classes.gridItem}>
                <span className={classes.pokemonFont}>ATK : {props.prop.attack}</span>
            </Grid>
            <Grid item xs={1}></Grid>
            <Grid item xs={1}></Grid>
            <Grid item xs={10} sm={5} className={classes.gridItem}>
                <span className={classes.pokemonFont}>DEF : {props.prop.def}</span>
            </Grid>
            <Grid item xs={10} sm={5} className={classes.gridItem}>
                <span className={classes.pokemonFont}>XP : {props.prop.xp}</span>
            </Grid>
            <Grid item xs={12} className={classes.gridItemLvl}>
                <span className={classes.pokemonFont}>LVL : {props.prop.lvl}</span>
            </Grid>
        </Grid>
    )
}