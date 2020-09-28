/**
 * Created on 2020-02-16 18:18
 * @summary: 
 * @author: Alexandre Allani
 */
pragma solidity ^0.6.1;
import "./FightRoom.sol";
import {myLib} from "./mylib.sol";

contract Cryptomons {
    /**
     * Get the the accepted trade for a given card
     * @param id Card id of which we want the potential buyers
     * @param add Address of the possible buyer
     */
    function getListBuyerVal(uint256 id, address add)
        public
        view
        returns (bool isOffer, bool acceptedTrade, address acceptedBuyer)
    {
        return (
            cards[id].potentialBuyers[0].listBuyer[add].isOffer,
            cards[id].potentialBuyers[0].acceptedTrade,
            cards[id].potentialBuyers[0].acceptedBuyer
        );
    }

    /**
     * Get the pending trades on a card id for a specific account
     * @param id Card id of which we want the potential trades
     * @param add Address of the account
     */
    function getPendingTrades(uint256 id, address add)
        public
        view
        returns (uint256 value, bool isInTrade)
    {
        return (
            trades[add].pendingtrade[id].value,
            trades[add].pendingtrade[id].isInTrade
        );
    }

    /**
     * Get the Offer of an exchange from a buyer
     * @param id Card id we want the offer of
     * @param add Address of the buyer
     */
    function getListExchange(uint256 id, address add)
        public
        view
        returns (bool isInOffer, uint256 card)
    {
        return (
            cards[id].potentialExchange[0].listOfExchange[add].isOffer,
            cards[id].potentialExchange[0].listOfExchange[add].id
        );
    }

    /**
     * Get the pending exchanges on a card id for a specific account
     * @param _id Card id of which we want the potential Exchange
     * @param add Address of the account
     */
    function getPendingExchange(uint256 _id, address add)
        public
        view
        returns (bool isInExchange, uint256 card)
    {
        return (
            exchanges[add].pendingExchange[_id].isInExchange,
            exchanges[add].pendingExchange[_id].id
        );
    }

    /**
     * Get the owner of a card
     * @param _id id of the card we want the owner
     * @return owner
     */
    function getCardOwner(uint256 _id) public view returns (address owner) {
        return cards[_id].owner;
    }

    /**
     * Get the properties of a card
     * @param _id id of the card we want the properties of
     */
    function getCardProp(uint256 _id)
        public
        view
        returns (
            myLib.Species species,
            uint256 hp,
            myLib.Types typ, //2100000000000000000
            uint256 attack,
            uint256 lvl,
            uint256 def,
            uint256 xp
        )
    {
        species = cards[_id].properties.species;
        hp = cards[_id].properties.hp;
        typ = cards[_id].properties.typ;
        attack = cards[_id].properties.attack;
        lvl = cards[_id].properties.lvl;
        def = cards[_id].properties.def;
        xp = cards[_id].properties.xp;
    }

    struct ListBuyer {
        mapping(address => Offer) listBuyer;
        address[] buyers;
        mapping(address => bool) isIn;
        bool acceptedTrade;
        address acceptedBuyer;
    }

    struct ListExchange {
        mapping(address => OfferExchange) listOfExchange;
        address[] exchanger;
        mapping(address => bool) isIn;
    }

    struct Properties {
        myLib.Species species;
        uint256 hp;
        myLib.Types typ;
        uint256 attack;
        uint256 lvl;
        uint256 def;
        uint256 xp;
    }

    struct Card {
        uint256 id;
        address payable owner;
        uint256 price;
        bool inStore;
        bool isSellable;
        // Buy by player
        mapping(uint256 => ListBuyer) potentialBuyers; //Only 1st element used
        mapping(uint256 => ListExchange) potentialExchange;
        // Breeding
        uint256 timebreed;
        bool isBreeding;
        uint256 breedsWith;
        bool breedCollected;
        Properties properties;
        // Fighting
        FightRoom fightRoom;
        bool isFighting;
    }

    struct PendingTrade {
        uint256 lastid;
        uint256[] listCard;
        mapping(uint256 => bool) isIn;
        mapping(uint256 => Trade) pendingtrade;
    }

    struct PendingExchange {
        uint256 lastid;
        uint256[] listCard;
        mapping(uint256 => bool) isIn;
        mapping(uint256 => Exchange) pendingExchange;
    }

    struct Trade {
        bool isInTrade;
        uint256 value;
    }

    struct Exchange {
        bool isInExchange;
        uint256 id;
    }

    struct OfferExchange {
        bool isOffer;
        uint256 id;
    }

    struct Offer {
        bool isOffer;
        uint256 value;
    }

    address public manager;
    mapping(uint256 => Card) cards;

    // Trades info
    mapping(address => PendingTrade) public trades; // Info on trades

    // Exchange Info
    mapping(address => PendingExchange) public exchanges;

    mapping(address => uint256[]) public ownersToCard;

    uint256 public totalCards = 0;
    uint256 max = 2**256 - 1;
    uint256 default_price = 1000000000000000000;

    // Modifiers

    modifier onlyManager() {
        require(msg.sender == manager, "Only manager can call this.");
        _;
    }

    modifier hasPaid(uint256 id) {
        require(
            msg.value == cards[id].price,
            "Unauthorized access to changeOwnerShip"
        );
        _;
    }

    modifier onlyCardOwner(uint256 id, address suppOwner) {
        require(
            cards[id].owner == suppOwner,
            "Only card Owner can access this"
        );
        _;
    }

    modifier validId(uint256 id) {
        require(id < totalCards, "invalid id");
        _;
    }

    modifier notBreeding(uint256 cardId) {
        require(
            cards[cardId].isBreeding == false,
            "Not possible now, Cryptomon in breed"
        );
        _;
    }

    modifier notFighting(uint256 cardId) {
        require(
            cards[cardId].isFighting == false,
            "Not possible now, Cryptomon in fight"
        );
        _;
    }

    /*
        CARD CREATION
        */

    constructor() public {
        manager = msg.sender;
        createCharamander();
        createSquirtle();
        createBulbasaur();
        createPidgey();
        createCharamander();
        createSquirtle();
        createBulbasaur();
        createPidgey();
    }

    /**
     * Create a Charamander Card
     */
    function createCharamander() public onlyManager {
        createCard(
            myLib.Species.CHARMANDER,
            default_price,
            20,
            110,
            8,
            myLib.Types.FIRE
        );
    }

    /**
     * Create a Squirtle Card
     */
    function createSquirtle() public onlyManager {
        createCard(
            myLib.Species.SQUIRTLE,
            default_price,
            30,
            70,
            4,
            myLib.Types.WATER
        );
    }

    /**
     * Create a Bulbasaur Card
     */
    function createBulbasaur() public onlyManager {
        createCard(
            myLib.Species.BULBASAUR,
            default_price,
            10,
            200,
            20,
            myLib.Types.PLANT
        );
    }

    /**
     * Create a Pidgey Card
     */
    function createPidgey() public onlyManager {
        createCard(
            myLib.Species.PIDGEY,
            default_price,
            22,
            100,
            7,
            myLib.Types.AIR
        );
    }

    /**
     * Create a card with given properties
     */
    function createCard(
        myLib.Species species,
        uint256 price,
        uint256 attack,
        uint256 hp,
        uint256 def,
        myLib.Types typ
    ) public onlyManager {
        // Bool breed : if card created from breed true else
        require(totalCards <= max, "Can't create more card");
        Card storage card = cards[totalCards];
        card.id = totalCards;

        card.owner = msg.sender;

        card.properties.species = species;

        card.price = price;
        card.inStore = true;
        card.isSellable = true;

        // Properties
        card.properties.lvl = 1;
        card.properties.attack = attack;
        card.properties.hp = hp;
        card.properties.def = def;
        card.properties.typ = typ;
        card.properties.xp = 0;

        //
        card.breedCollected = true;
        card.isFighting = false;
        card.isBreeding = false;

        totalCards++;
    }

    /**
     * Create a card from breed
     */
    function createCard_breed(
        myLib.Species species,
        uint256 price,
        uint256 attack,
        uint256 hp,
        uint256 def,
        myLib.Types typ
    ) internal {
        // Bool breed : if card created from breed true else
        require(totalCards <= max, "Can't create more card");
        Card storage card = cards[totalCards];
        cards[totalCards].id = totalCards;
        cards[totalCards].owner = msg.sender;
        ownersToCard[msg.sender].push(totalCards);

        cards[totalCards].properties.species = species;

        cards[totalCards].price = price;
        cards[totalCards].inStore = false;
        cards[totalCards].isSellable = false;

        // Properties
        cards[totalCards].properties.lvl = 1;
        cards[totalCards].properties.attack = attack;
        cards[totalCards].properties.hp = hp;
        cards[totalCards].properties.def = def;
        cards[totalCards].properties.typ = typ;
        cards[totalCards].properties.xp = 0;

        //
        cards[totalCards].breedCollected = true;
        cards[totalCards].isFighting = false;
        cards[totalCards].isBreeding = false;

        totalCards++;
    }

    /*
        BUY/SELL FUNCTIONS
        */
    /**
     * Add an Offer to the list of Offer from a card
     */
    function addToListBuyer(ListBuyer storage lb, address _buyer, uint256 value)
        internal
    {
        lb.listBuyer[_buyer] = Offer(true, value);
        if (!lb.isIn[_buyer]) {
            lb.isIn[_buyer] = true;
            lb.buyers.push(_buyer);
        }
    }

    /**
     * Add on Offer to the list of Trade the buyer has with a card
     */
    function addToTrade(
        PendingTrade storage pd,
        uint256 _idCard,
        Trade memory value
    ) internal {
        pd.pendingtrade[_idCard] = value;
        if (!pd.isIn[_idCard]) {
            pd.isIn[_idCard] = true;
            pd.listCard.push(_idCard);
        }
    }

    /**
     * Make a priced offer to a card
     */
    function makeOffer(uint256 id, uint256 value) public validId(id) {
        require(cards[id].isSellable == true, "This Cryptomon is not in sale");
        addToListBuyer(cards[id].potentialBuyers[0], msg.sender, value);
        addToTrade(trades[msg.sender], id, Trade(true, value));
    }

    /**
     * Accept a priced offer
     */
    function acceptOffer(uint256 id, address _buyer)
        public
        validId(id)
        onlyCardOwner(id, msg.sender)
    {
        cards[id].potentialBuyers[0].acceptedTrade = true;
        cards[id].potentialBuyers[0].acceptedBuyer = _buyer;
        cards[id].price = cards[id].potentialBuyers[0].listBuyer[_buyer].value;
    }

    /**
     * Buy a specific card from the store
     */
    function buyCard(uint256 id) public payable validId(id) {
        require(msg.value == cards[id].price, "Doesn't correspond to price");
        require(
            cards[id].inStore == true,
            "This Cryptomon is already owned, buy from player"
        );
        require(cards[id].isSellable == true, "This Cryptomon is not in sale");

        changeOwnerShip(id, cards[id].owner, msg.sender);
        cards[id].inStore = false;
        cards[id].isSellable = false;
    }

    /**
     * Buy a card from the player
     */
    function buyCardFromPlayer(uint256 id)
        public
        payable
        validId(id)
        notBreeding(id)
    {
        require(
            cards[id].inStore == false,
            "This Cryptomon is not owned, buy from store"
        );
        require(cards[id].isSellable == true, "This Cryptomon is not in sale");
        require(msg.value == cards[id].price, "Doesn't correspond to price");
        require(
            cards[id].potentialBuyers[0].acceptedTrade,
            "Trade was not accepted"
        );
        require(
            msg.sender == cards[id].potentialBuyers[0].acceptedBuyer,
            "You are not the accepted Buyer"
        );

        // Notify other potential buyers that they did not get it [Maybe add notify bool to Trade to indeed notify]
        // Remove previous list of potential buyers

        cards[id].potentialBuyers[0].acceptedTrade = false;

        address[] memory prevBuyers = cards[id].potentialBuyers[0].buyers;
        for (uint256 i = 0; i < prevBuyers.length; i++) {
            trades[prevBuyers[i]].pendingtrade[id].isInTrade = false;
            cards[id].potentialBuyers[0].listBuyer[prevBuyers[i]] = Offer(
                false,
                0
            );
        }

        // Pay the previous owner
        address payable seller = cards[id].owner;

        changeOwnerShip(id, cards[id].owner, msg.sender);
        cards[id].isSellable = false;
        seller.transfer(msg.value);

    }

    /*
        Exchange functions
        */

    /**
     * Add an Offer to the list of exchange of a card
     */
    function addToListExchange(
        ListExchange storage le,
        address _exchanger,
        uint256 card
    ) internal {
        le.listOfExchange[_exchanger] = OfferExchange(true, card);
        if (!le.isIn[_exchanger]) {
            le.isIn[_exchanger] = true;
            le.exchanger.push(_exchanger);
        }
    }

    /**
     * Add on Offer to the list of Exchange the buyer has with a card
     */
    function addToExchange(
        PendingExchange storage pe,
        uint256 _idCard,
        Exchange memory _cardToExchange
    ) internal {
        pe.pendingExchange[_idCard] = _cardToExchange;
        if (!pe.isIn[_idCard]) {
            pe.isIn[_idCard] = true;
            pe.listCard.push(_idCard);
        }
    }

    /**
     * Make an exchange offer
     */
    function makeOfferExchange(uint256 cardIdToGet, uint256 cardIdToExchange)
        public
        validId(cardIdToGet)
        validId(cardIdToExchange)
        onlyCardOwner(cardIdToExchange, msg.sender)
    {
        addToListExchange(
            cards[cardIdToGet].potentialExchange[0],
            msg.sender,
            cardIdToExchange
        );
        addToExchange(
            exchanges[msg.sender],
            cardIdToGet,
            Exchange(true, cardIdToExchange)
        );
    }

    /**
     * Accept an exchange offer
     */
    function acceptOfferExchange(uint256 id, address _exchanger)
        public
        validId(id)
        onlyCardOwner(id, msg.sender)
        notBreeding(id)
    {
        require(
            cards[id].potentialExchange[0].listOfExchange[_exchanger].isOffer ==
                true,
            "You are not allowed to exchange"
        );
        require(
            cards[id].potentialExchange[0].isIn[_exchanger] == true,
            "You are not allowed to exchange"
        );

        address payable _sender = msg.sender;
        address payable _exchangerP = payable(_exchanger);

        changeOwnerShipExchange(id, _sender, _exchangerP);
        changeOwnerShipExchange(
            cards[id].potentialExchange[0].listOfExchange[_exchanger].id,
            _exchangerP,
            _sender
        );

        // Notify other potential exchanger that they did not get it [Maybe add notify bool to Trade to indeed notify]
        // Remove previous list of potential exchangers

        address[] memory prevExchangers = cards[id].potentialExchange[0]
            .exchanger;
        for (uint256 i = 0; i < prevExchangers.length; i++) {
            exchanges[prevExchangers[i]].pendingExchange[id]
                .isInExchange = false;
            cards[id].potentialExchange[0]
                .listOfExchange[prevExchangers[i]] = OfferExchange(false, 0);
        }

    }

    /*
        Breeding
        */

    /**
     * Starts the breeding between two parents
     */
    // Breeding can suffer is miner sets the timestamp inside the block as he wants to manipulate the time
    function startBreeding(uint256 parentA, uint256 parentB)
        public
        onlyCardOwner(parentA, msg.sender)
        notBreeding(parentA)
        notFighting(parentA)
        notBreeding(parentB)
        notFighting(parentB)
        onlyCardOwner(parentB, msg.sender)
    {
        require(parentA != parentB, "Can t breed with same parent");
        uint256 tmp = myLib.max_f(
            now + cards[parentA].properties.lvl * 60,
            now + cards[parentB].properties.lvl * 60
        );
        cards[parentA].timebreed = tmp;
        cards[parentB].timebreed = tmp;

        cards[parentA].isBreeding = true;
        cards[parentB].isBreeding = true;
        cards[parentA].breedCollected = false;
        cards[parentB].breedCollected = false;

        cards[parentA].breedsWith = parentB;
        cards[parentB].breedsWith = parentA;
    }

    /**
     * Collect result of the breeding and create a new Pokemon
     */
    // myLib.Species species, uint256 price, uint attack, uint hp, uint def, myLib.Types typ
    function collectBreeding(uint256 parentA, uint256 parentB)
        public
        onlyCardOwner(parentA, msg.sender)
        onlyCardOwner(parentB, msg.sender)
    {
        require(
            (cards[parentA].breedsWith == parentB) &&
                (cards[parentB].breedsWith == parentA),
            "Parents are not breeding together"
        );
        require(now > cards[parentA].timebreed, "Wait until end time");

        myLib.Species tmp_species = myLib.Species(
            (uint256(cards[parentA].properties.species) +
                uint256(cards[parentB].properties.species)) /
                2
        );
        myLib.Types tmp_typ = myLib.Types(
            (uint256(cards[parentA].properties.typ) +
                uint256(cards[parentB].properties.typ)) /
                2
        );
        uint256 tmp_attack = (cards[parentA].properties.attack +
            cards[parentB].properties.attack) /
            2;
        uint256 tmp_hp = (cards[parentA].properties.hp +
            cards[parentB].properties.hp) /
            2;
        uint256 tmp_def = (cards[parentA].properties.def +
            cards[parentB].properties.def) /
            2;
        cards[parentA].isBreeding = false;
        cards[parentB].isBreeding = false;

        cards[parentA].breedCollected = true;
        cards[parentB].breedCollected = true;

        createCard_breed(
            tmp_species,
            default_price,
            tmp_attack,
            tmp_hp,
            tmp_def,
            tmp_typ
        ); //Species species, uint256 price, uint attack, uint hp

    }

    /*
        Fighting
        */

    /**
     * Start a fight. Create a new fighting room instance
     */
    function startFight(uint256 fighter1, uint256 fighter2)
        public
        onlyCardOwner(fighter1, msg.sender)
        notFighting(fighter1)
        notFighting(fighter2)
        notBreeding(fighter1)
        notBreeding(fighter2)
        returns (address fightAdd)
    {
        require(fighter1 != fighter2, "Cannot be the same Fighter");
        require(
            cards[fighter1].owner != cards[fighter2].owner,
            "Cannot be the same owner"
        );
        FightRoom mfroom = new FightRoom(fighter1, fighter2, address(this));
        cards[fighter1].fightRoom = mfroom;
        cards[fighter1].isFighting = true;
        cards[fighter2].fightRoom = mfroom;
        cards[fighter2].isFighting = true;

        fightAdd = address(mfroom);
    }

    /*
        CHANGE STATES
        */

    /**
     * Make a card sellable (It can accept offer)
     */
    function makeSellable(uint256 id)
        public
        onlyCardOwner(id, msg.sender)
        validId(id)
    {
        cards[id].isSellable = true;
    }

    /**
     * Make a card Unsellable (It cannot accept an offer)
     */
    function makeUnsellable(uint256 id)
        public
        onlyCardOwner(id, msg.sender)
        validId(id)
    {
        cards[id].isSellable = false;
    }

    /**
     * Set a card in store
     */
    function setinStore(uint256 id, bool inStore)
        public
        onlyCardOwner(id, msg.sender)
        validId(id)
    {
        cards[id].inStore = inStore;
    }

    /*
        Getter and setter for fighting
        */

    function getHp(uint256 id) public view returns (uint256 hp) {
        return cards[id].properties.hp;
    }

    function getSpecies(uint256 id)
        public
        view
        returns (myLib.Species species)
    {
        return cards[id].properties.species;
    }

    function getAttack(uint256 id) public view returns (uint256 attack) {
        return cards[id].properties.attack;
    }

    function getLvl(uint256 id) public view returns (uint256 lvl) {
        return cards[id].properties.lvl;
    }

    function getDefense(uint256 id) public view returns (uint256 defense) {
        return cards[id].properties.def;
    }

    function getType(uint256 id) public view returns (myLib.Types typ) {
        return cards[id].properties.typ;
    }

    function getOwner(uint256 id) public view returns (address payable owner) {
        return cards[id].owner;
    }

    function getXP(uint256 id) public view returns (uint256 xp) {
        return cards[id].properties.xp;
    }

    function getLengthOwnerToCard(address owner)
        public
        view
        returns (uint256 len)
    {
        len = ownersToCard[owner].length;
    }

    function getCardInfo(uint256 id)
        public
        view
        returns (
            uint256 _id,
            address owner,
            uint256 price,
            bool inStore,
            bool isSellable,
            uint256 timebreed,
            bool isBreeding,
            uint256 breedsWith,
            address fightRoom,
            bool isFighting,
            bool breedCollected
        )
    {
        _id = cards[id].id;
        owner = cards[id].owner;
        price = cards[id].price;
        inStore = cards[id].inStore;
        isSellable = cards[id].isSellable;
        timebreed = cards[id].timebreed;
        isBreeding = cards[id].isBreeding;
        breedsWith = cards[id].breedsWith;
        fightRoom = address(cards[id].fightRoom);
        isFighting = cards[id].isFighting;
        breedCollected = cards[id].breedCollected;
    }

    function getLengthListBuyer(uint256 id) public view returns (uint256) {
        return cards[id].potentialBuyers[0].buyers.length;
    }

    function getAddressBuyer(uint256 cardID, uint256 index)
        public
        view
        returns (address buyer)
    {
        buyer = cards[cardID].potentialBuyers[0].buyers[index];
    }

    function getLengthListExchange(uint256 id) public view returns (uint256) {
        return cards[id].potentialExchange[0].exchanger.length;
    }

    function getAddressExhchange(uint256 cardID, uint256 index)
        public
        view
        returns (address buyer)
    {
        buyer = cards[cardID].potentialExchange[0].exchanger[index];
    }

    function getOffer(uint256 id, address buyer)
        public
        view
        returns (bool isOffer, uint256 value)
    {
        isOffer = cards[id].potentialBuyers[0].listBuyer[buyer].isOffer;
        value = cards[id].potentialBuyers[0].listBuyer[buyer].value;
    }

    function getOfferExchange(uint256 id, address buyer)
        public
        view
        returns (bool isOffer, uint256 card)
    {
        isOffer = cards[id].potentialExchange[0].listOfExchange[buyer].isOffer;
        card = cards[id].potentialExchange[0].listOfExchange[buyer].id;
    }

    /*
        END FIGHTING
    */
    /**
     * Function called after the end of a fight. Grants xp to the winner
     */
    function endFight(address froom, uint256 id, uint256 loser) public {
        require(
            address(cards[id].fightRoom) == froom,
            "Not right fightroom"
        );
        require(cards[id].fightRoom.getEnded() == true, "Battle did not ended");
        require(
            cards[id].fightRoom.getExpired() == false,
            "Battle has expired can't get more award"
        );
        uint256[4] memory possibleGain = cards[id].fightRoom.getPossibleGain();
        cards[id].properties.xp += possibleGain[0];
        cards[id].properties.attack += possibleGain[1];
        cards[id].properties.def += possibleGain[2];
        cards[id].properties.lvl += possibleGain[3];
        cards[id].isFighting = false;
        cards[loser].isFighting = false;

        if (possibleGain[3] != 0) {
            cards[id].properties.xp = 0;
            cards[id].properties.xp = possibleGain[0];
        }
    }

    /*
        UTILS FUNCTIONS
        */
    /**
     * Change the ownership of a card after and exchange
     */
    function changeOwnerShipExchange(
        uint256 id,
        address formerOwner,
        address payable currOwner
    ) internal {
        cards[id].owner = currOwner;
        ownersToCard[currOwner].push(cards[id].id);

        // remove dependencies
        if (!cards[id].inStore) {
            uint256 lenOwn = ownersToCard[formerOwner].length;
            for (uint256 i = 0; i < lenOwn; i++) {
                if (ownersToCard[formerOwner][i] == id) {
                    ownersToCard[formerOwner][i] = ownersToCard[formerOwner][lenOwn -
                        1];
                    ownersToCard[formerOwner].pop();
                    break;
                }
            }
        }

    }

    /**
     * Change the ownership of a card
     */
    function changeOwnerShip(
        uint256 id,
        address payable formerOwner,
        address payable currOwner
    ) internal hasPaid(id) {
        cards[id].owner = currOwner;
        ownersToCard[currOwner].push(cards[id].id);

        // remove dependencies
        if (!cards[id].inStore) {
            uint256 lenOwn = ownersToCard[formerOwner].length;
            for (uint256 i = 0; i < lenOwn; i++) {
                if (ownersToCard[formerOwner][i] == id) {
                    ownersToCard[formerOwner][i] = ownersToCard[formerOwner][lenOwn -
                        1];
                    ownersToCard[formerOwner].pop();
                    break;
                }
            }
        }

    }

}
