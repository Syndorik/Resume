/*!

=========================================================
* Material Dashboard React - v1.8.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard-react
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/material-dashboard-react/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
// @material-ui/icons
import Person from "@material-ui/icons/Person";
import StoreIcon from '@material-ui/icons/Store';
import ShopTwoIcon from '@material-ui/icons/ShopTwo';
import ShareIcon from '@material-ui/icons/Share';
import FavoriteIcon from '@material-ui/icons/Favorite';
import FlashOnIcon from '@material-ui/icons/FlashOn';
import PlayArrowIcon from '@material-ui/icons/PlayArrow';

// core components/views for Admin layout
import MyCards from "views/MyCards/MyCards";
import Store from "views/Store/Store.js";
import StorePlayer from "views/StorePlayer/StorePlayer.js";
import StartFight from "views/StartFight/StartFight.js";
import FightingRoom from "views/FightingRoom/FightingRoom.js";
import Breeding from "views/Breeding/Breeding.js"
import StoreExchange from "views/StoreExchange/StoreExchange.js"

const dashboardRoutes = [
    {
        path: "/myCards",
        name: "My Cards",
        icon: Person,
        component: MyCards,
        layout: "/cryptomons"
    },
    {
        path: "/breeding",
        name: "Breeding",
        icon: FavoriteIcon,
        component: Breeding,
        layout: "/cryptomons"
    },
    {
        path: "/store",
        name: "Store",
        icon: StoreIcon,
        component: Store,
        layout: "/cryptomons"
    },
    {
        path: "/buyFromPlayers",
        name: "Buy From Players",
        icon: ShopTwoIcon,
        component: StorePlayer,
        layout: "/cryptomons"
    },
    {
        path: "/exchange",
        name: "Exchange With Players",
        icon: ShareIcon,
        component: StoreExchange,
        layout: "/cryptomons"
    },
    {
        path: "/fight",
        name: "Start a fight",
        icon: PlayArrowIcon,
        component: StartFight,
        layout: "/cryptomons"
    },
    {
        path: "/sfightRooms",
        name: "Fighting Rooms",
        icon: FlashOnIcon,
        component: FightingRoom,
        layout: "/cryptomons"
    },


];

export default dashboardRoutes;
