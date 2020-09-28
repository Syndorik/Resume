import {
    successColor,
    whiteColor,
    grayColor,
    hexToRgb
} from "assets/jss/material-dashboard-react.js";

const dashboardStyle = {
    successText: {
        color: successColor[0]
    },
    upArrowCardCategory: {
        width: "16px",
        height: "16px"
    },
    stats: {
        color: grayColor[0],
        display: "inline-flex",
        fontSize: "12px",
        lineHeight: "22px",
        "& svg": {
            top: "4px",
            width: "16px",
            height: "16px",
            position: "relative",
            marginRight: "3px",
            marginLeft: "3px"
        },
        "& .fab,& .fas,& .far,& .fal,& .material-icons": {
            top: "4px",
            fontSize: "16px",
            position: "relative",
            marginRight: "3px",
            marginLeft: "3px"
        }
    },
    cardCategory: {
        color: grayColor[0],
        margin: "0",
        fontSize: "14px",
        marginTop: "10px",
        paddingTop: "10px",
        marginBottom: "10px"
    },
    cardCategoryWhite: {
        color: "rgba(" + hexToRgb(whiteColor) + ",.62)",
        margin: "0",
        fontSize: "14px",
        marginTop: "0",
        marginBottom: "0"
    },
    cardTitle: {
        color: grayColor[2],
        marginTop: "0px",
        minHeight: "auto",
        fontWeight: "300",
        fontFamily: "'Roboto', 'Helvetica', 'Arial', sans-serif",
        marginBottom: "3px",
        textDecoration: "none",
        "& small": {
            color: grayColor[1],
            fontWeight: "400",
            lineHeight: "1"
        }
    },
    cardTitleWhite: {
        color: whiteColor,
        marginTop: "0px",
        minHeight: "auto",
        fontWeight: "300",
        fontFamily: "'Roboto', 'Helvetica', 'Arial', sans-serif",
        marginBottom: "3px",
        textDecoration: "none",
        "& small": {
            color: grayColor[1],
            fontWeight: "400",
            lineHeight: "1"
        }
    },
    fitImage: {
        "width": "50%",
        "position": "sticky",
        "top": "50%",
        "bottom": "50%"
    },
    fitImageMine: {
        "maxHeight": "100%",
        "maxWidth": "100%",
        "position": "sticky",
        "top": "50%",
        "bottom": "50%",
    },
    fitImageMineAttack: {
        "maxHeight": "100%",
        "maxWidth": "100%",
        "position": "sticky",
        "top": "50%",
        "bottom": "50%",
        "animation": "linear",
        "animationName": "$run",
        "animationDuration": "3s"
    },
    fitImageMineDefense: {
        "maxHeight": "100%",
        "maxWidth": "100%",
        "position": "sticky",
        "top": "50%",
        "bottom": "50%",
        "animation": "linear",
        "animationName": "$runDef",
        "animationDuration": "3s"
    },
    fitImageOp: {
        "maxHeight": "100%",
        "maxWidth": "100%",
        "position": "sticky",
        "top": "50%",
        "bottom": "50%"
    },
    centerAlign: {
        "text-align": "center",
        "display": "block",
    },
    pokemonFont: {
        "font-family": "'pokemon-font', monospace",
        "font-smooth": "never",
        "-webkit-font-smoothing": "none",
        "font-size": "130%"
    },
    pokemonFontFight: {
        "font-family": "'pokemon-font', monospace",
        "font-smooth": "never",
        "-webkit-font-smoothing": "none",
        "font-size": "160%",
        "color": "black"
    },
    cardheight: {
        "height": "100%",
    },
    scd: {
        "height": "100%",
        "marginRight": "15px",
        "marginLeft": "15px",
        "font-family": "'pokemon-font', monospace",
        "font-smooth": "never",
        "-webkit-font-smoothing": "none",
    },
    addPadding: {
        "padding": "20px",
        "color": "white",
        "background-color": "#3f51b5",
    },
    positionleft: {
        "position": "sticky",
        "right": "100%",
        "color": "white",
    },
    titlefight: {
        "font-size": "30px",
        "fontWeight": "bold",
        "position": "sticky",
        "top": "50%"
    },
    positionAbsolute: {
        "position": "absolute"
    },
    positionRight: {
        "position": "sticky",
        "left": "100%",
        "color": "grey",
    },
    pokemonFontnoBold: {
        "font-family": "'pokemon-font', monospace",
        "font-smooth": "never",
        "-webkit-font-smoothing": "none",
    },
    twoRoundCard: {
        "border": "7px double #000000",
        "border-radius": "40px 40px 0px 0px"
    },
    allroundCard: {
        "border": "7px double #000000",
        "border-radius": "40px 40px 40px 40px"
    },
    BottomRoundCard: {
        "border": "7px double #000000",
        "border-radius": "0px 0px 40px 40px"
    },
    noroundCard: {
        "border": "7px double #000000",
        "border-radius": "0"
    },
    onlyBottom: {
        "border-bottom": "2px solid #000000",
        "border-radius": "40px 40px 0px 0px",
        "padding-bottom": "10px",
        "padding-top": "10px",
    },
    gridItem: {
        "margin": "10px 0px 10px 0px",
        "textAlign": "left"
    },
    gridItemLvl: {
        "margin": "10px 0px 10px 0px",
        "textAlign": "center"
    },
    appBar: {
        position: 'relative',
    },
    upcontainer: {
        height: "100%",
        width: "100%"
    },
    containerFight: {
        height: " 80%"
    },
    selectAction: {
        "border": "7px double #000000",
        "border-radius": "0px",
        "height": "20%",
        "textAlign": "center"
    },
    flexCentre: {
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
    },
    arrowgame: {
        "display": "flex",
        "align-items": "center",
        "justify-content": "flex-end"
    },

    hpBar: {
        "border-radius": "15px 0px 15px 0px",
        "width": "40%",
        "border": "7px solid #385021",
        "background-color": "#f8f8d8",

    },

    "@keyframes run": {
        "0%": { "right": "50%" },
        "50%": { "right": "100%" },
        "100%": { "right": "50%" }
    },

    "@keyframes runDef": {
        "0%": { "left": "0%" },
        "50%": { "left": "50%" },
        "100%": { "left": "0%" }
    }
};

export default dashboardStyle;
