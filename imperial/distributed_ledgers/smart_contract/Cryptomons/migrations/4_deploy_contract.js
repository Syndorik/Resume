var Cryptomons = artifacts.require("./Cryptomons.sol");
var Frooms = artifacts.require("./FightRoom.sol");
var myLib = artifacts.require("./myLib.sol");
const fs = require('fs')




module.exports = (deployer, network) => {
    deployer.deploy(myLib);
    deployer.link(myLib, Cryptomons);
    deployer.link(myLib, Frooms);
    deployer.deploy(Cryptomons);
    deployer.link(Cryptomons, Frooms).then(() => {
        fs.writeFile("../../UI/cryptomonUI/src/blockchain/address.json", JSON.stringify({ "address": Cryptomons.address }), function (err) {
            if (err) {
                console.log(err);
            }
        });
    })


};