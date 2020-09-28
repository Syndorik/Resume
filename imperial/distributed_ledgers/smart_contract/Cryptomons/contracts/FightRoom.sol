/**
 * Created on 2020-02-16 18:18
 * @summary:
 * @author: Alexandre Allani
 */
pragma solidity ^0.6.1;
import "./Cryptomons.sol";
import {myLib} from "./mylib.sol";

contract FightRoom {
    address public manager;
    Cryptomons public cryptomons;
    uint256 internal nonce = 0;

    struct CombatCard {
        uint256 id;
        uint256 otherFight;
        address payable owner;
        Properties properties;
        Alterations alterations;
        // ADD TYPE
        bool waiting;
    }

    struct Properties {
        myLib.Species species;
        myLib.Types typ;
        uint256 maxhp;
        int256 hp;
        uint256 attack;
        uint256 lvl;
        uint256 def;
        uint256 bonusCritic;
        uint256 dodgeChance;
    }

    struct Alterations {
        // 2 ticks Damage over time
        bool isInFire;
        uint256 turnFireRemaing;
        // 4 ticks Damage over time (more damage than fire in total)
        bool isPoisoned;
        uint256 turnPoisonRemaining;
        // Higher chance to miss
        bool isInSoaked;
        uint256 turnSoakedRemaining;
        // Higher chance to receive critic attack
        bool isInAir;
        uint256 turnAirRemaining;
        bool isInDef;
        uint256 turnDefRemaining;
    }

    // GAIN lvl
    uint256 MAXXP = 1000;
    uint256 XPGAIN = 200;

    // CONST
    uint256 ADVHP = 10;
    uint256 ADVATK = 10;
    uint256 ADVDEF = 10;

    // Percentage of turn more considering lvl
    uint256 PERC_TURNDEFLVL = 20;
    uint256 PERC_TURNALTAIR = 20;
    uint256 PERC_TURNALTFIRE = 20;
    uint256 PERC_TURNALTPOISON = 40;
    uint256 PERC_TURNALTSOAKED = 20;

    // Percentage of of ticks

    uint256 PERC_TICKFIRE = 33;
    uint256 PERC_TICKPOISON = 24;

    // Percentage of resistance to attack while in defense
    uint256 PERC_DEFRESATK = 50;

    // Chance apply alter
    uint256 CHANCE_APPLY_ALTER = 70;
    uint256 CHANCE_APPLY_CRIT = 90;
    uint256 CHANCE_APPLY_DODGE = 90;

    uint256 BONCRITIC = 20;
    uint256 PERC_CRITBYLVL = 50;

    uint256 DODGECHANCE = 20;
    uint256 PERC_DODGEBYLVL = 50;

    // STATE VARIABLE

    mapping(uint256 => CombatCard) cards;
    uint256 currentFighter;
    uint256 otherFighter;
    int256 diffLvl;

    // End game
    uint256[4] possibleGain; // 0 ==> XP, 1 ==> ATK, 2 ==> DEF, 3 ==> LVL
    bool hasEnded;
    bool hasExpired;

    bool isThereDominantFighter;
    address dominantFighter;

    /*
        MODIFIERS
    */
    modifier onlyManager() {
        // Modifier
        require(msg.sender == manager, "Only manager can call this.");
        _;
    }

    modifier onlyFighter() {
        // Modifier
        require(
            msg.sender == cards[currentFighter].owner,
            "It is not your turn"
        );
        _;
    }

    /**
     * Create the Fighting room, and attributes gives the first round
     * to a player. Also decides whether or not there is a dominant fighter in
     * terms of type
     */
    constructor(uint256 _fighter1, uint256 _fighter2, address cryptAdress)
        public
    {
        manager = msg.sender;
        cryptomons = Cryptomons(cryptAdress);

        Properties memory prop_f1 = setProperties(
            cryptomons.getHp(_fighter1),
            cryptomons.getAttack(_fighter1),
            cryptomons.getDefense(_fighter1),
            cryptomons.getLvl(_fighter1),
            cryptomons.getType(_fighter1),
            cryptomons.getSpecies(_fighter1)
        );

        Properties memory prop_f2 = setProperties(
            cryptomons.getHp(_fighter2),
            cryptomons.getAttack(_fighter2),
            cryptomons.getDefense(_fighter2),
            cryptomons.getLvl(_fighter2),
            cryptomons.getType(_fighter2),
            cryptomons.getSpecies(_fighter2)
        );

        cards[_fighter1] = setCard(
            _fighter1,
            cryptomons.getOwner(_fighter1),
            prop_f1
        );
        cards[_fighter2] = setCard(
            _fighter2,
            cryptomons.getOwner(_fighter2),
            prop_f2
        );

        cards[_fighter2].otherFight = _fighter1;
        cards[_fighter1].otherFight = _fighter2;

        if (random(0) >= 50) {
            cards[_fighter1].waiting = false;
            cards[_fighter2].waiting = true;
            currentFighter = _fighter1;
            otherFighter = _fighter2;
        } else {
            cards[_fighter1].waiting = true;
            cards[_fighter2].waiting = false;
            currentFighter = _fighter2;
            otherFighter = _fighter1;
        }

        int256 result = myLib.getMatchUp(
            _fighter1,
            _fighter2,
            uint256(cards[_fighter1].properties.typ),
            uint256(cards[_fighter2].properties.typ)
        );

        if (result == -1) {
            isThereDominantFighter = false;
        } else {
            uint256 mres = uint256(result);
            isThereDominantFighter = true;
            dominantFighter = cards[mres].owner;
            cards[mres].properties.attack +=
                (cards[mres].properties.attack * ADVATK) /
                100;
            cards[mres].properties.def +=
                (cards[mres].properties.def * ADVDEF) /
                100;
            cards[mres].properties.hp +=
                (cards[mres].properties.hp * int256(ADVHP)) /
                100;
        }

        diffLvl = abs(
            int256(cards[_fighter1].properties.lvl),
            int256(cards[_fighter2].properties.lvl)
        );
        possibleGain = [0, 0, 0, 0];
        hasEnded = false;

    }

    /*
        Fighting
        */

    /**
     * Get the maximum number of Turn in alteration defense
     * @param id id
     */
    function getNumberTurnDef(uint256 id) public view returns (uint256) {
        return 3 + (cards[id].properties.def * PERC_TURNDEFLVL) / 100;
    }

    /**
     * Get the maximum number of Turn in alteration Air
     *  @param id id
     */
    function getNumberTurnAir(uint256 id) public view returns (uint256) {
        //Id correspond to enemy one
        return 3 + ((cards[id].properties.lvl * PERC_TURNALTAIR) / 100);
    }

    /**
     * Get the maximum number of Turn in alteration Poison
     *  @param id id
     */
    function getNumberTurnPoison(uint256 id) public view returns (uint256) {
        return 6 + ((cards[id].properties.lvl * PERC_TURNALTPOISON) / 100);
    }

    /**
     *  Get the maximum number of Turn in alteration Fire
     *  @param id id
     */
    function getNumberTurnFire(uint256 id) public view returns (uint256) {
        return 3 + ((cards[id].properties.lvl * PERC_TURNALTFIRE) / 100);
    }

    /**
     *  Get the maximum number of Turn in alteration Water
     *  @param id id
     */
    function getNumberTurnSoaked(uint256 id) public view returns (uint256) {
        return 3 + ((cards[id].properties.lvl * PERC_TURNALTSOAKED) / 100);
    }

    /**
     *  Get the increase of opponent dodging after Alteration
     *  @param id id
     */
    function getDodgeChanceUp(uint256 id) public view returns (uint256) {
        return
            min_f(
                90,
                DODGECHANCE +
                    ((cards[id].properties.lvl * PERC_DODGEBYLVL) / 100)
            );
    }

    /**
     * Get the increase of opponent Critics after Alteration
     *  @param id id
     */
    function getCriticUp(uint256 id) public view returns (uint256) {
        return
            min_f(
                90,
                BONCRITIC + ((cards[id].properties.lvl * PERC_CRITBYLVL) / 100)
            );
    }

    /**
     * Get the fire tick damage
     * @param attackerID attackerID
     */
    function getFireTick(uint256 attackerID) public view returns (uint256) {
        return (cards[attackerID].properties.attack * PERC_TICKFIRE) / 100;
    }

    /**
     * Get the posion tick damage
     * @param attackerID attackerID
     */
    function getPoisonTick(uint256 attackerID) public view returns (uint256) {
        return (cards[attackerID].properties.attack * PERC_TICKPOISON) / 100;
    }

    /**
     * If called, give the opponent the possible alteration made by the
     * attacker
     * @param attackerID attackerID
     * @param attacked attacked
     */
    function makePossibleAlteration(uint256 attackerID, uint256 attacked)
        internal
    {
        if (cards[attackerID].properties.typ == myLib.Types.FIRE) {
            alteredByFire(attackerID, attacked);
        } else if (cards[attackerID].properties.typ == myLib.Types.WATER) {
            alteredByWater(attackerID, attacked);
        } else if (cards[attackerID].properties.typ == myLib.Types.PLANT) {
            alteredByPlant(attackerID, attacked);
        } else {
            //AIR
            alteredByAir(attackerID, attacked);
        }
    }

    /**
     * Alter the attacked Pokemon with Fire
     * @param attackerID attackerID
     * @param attacked attacked
     */
    function alteredByFire(uint256 attackerID, uint256 attacked)
        internal
        onlyFighter()
    {
        cards[attacked].alterations.isInFire = true;
        cards[attacked].alterations.turnDefRemaining = getNumberTurnFire(
            attackerID
        );
    }

    /**
     * Alter the attacked Pokemon with Water
     * @param attackerID attackerID
     * @param attacked attacked
     */
    function alteredByWater(uint256 attackerID, uint256 attacked) internal {
        cards[attacked].alterations.isInSoaked = true;
        cards[attacked].alterations.turnSoakedRemaining = getNumberTurnSoaked(
            attackerID
        );
        cards[attackerID].properties.dodgeChance = getDodgeChanceUp(attackerID);
    }

    /**
     * Alter the attacked Pokemon with Poison
     * @param attackerID attackerID
     * @param attacked attacked
     */
    function alteredByPlant(uint256 attackerID, uint256 attacked) internal {
        cards[attacked].alterations.isPoisoned = true;
        cards[attacked].alterations.turnPoisonRemaining = getNumberTurnPoison(
            attackerID
        );
    }

    /**
     * Alter the attacked Pokemon with Air
     * @param attackerID attackerID
     * @param attacked attacked
     */
    function alteredByAir(uint256 attackerID, uint256 attacked) internal {
        cards[attacked].alterations.isInAir = true;
        cards[attacked].alterations.turnAirRemaining = getNumberTurnAir(
            attackerID
        );
        cards[attackerID].properties.bonusCritic = getCriticUp(attackerID);
    }

    /**
     * Do the attack action and deals damage. Chance of giving an
     * alteration
     */
    function actionAttack() public onlyFighter() {
        // Damages
        if (cards[otherFighter].alterations.isInDef) {
            dealDamageTo(
                otherFighter,
                currentFighter,
                (cards[currentFighter].properties.attack * PERC_DEFRESATK) / 100
            );
        } else {
            dealDamageTo(
                otherFighter,
                currentFighter,
                cards[currentFighter].properties.attack
            );
        }

        // Chance of alterations
        uint256 rd_tmp;
        if (
            cards[currentFighter].properties.lvl >
            cards[otherFighter].properties.lvl
        ) {
            rd_tmp = random(diffLvl);
        } else {
            rd_tmp = random(-diffLvl);
        }

        if (rd_tmp > CHANCE_APPLY_ALTER) {
            makePossibleAlteration(currentFighter, otherFighter);
        }

        endTurn();

    }

    /**
     * Deals a certain amount of damage to the attacked Pokemon
     *  @param id id
     * @param by by
     * @param damag damag
     */
    function dealDamageTo(uint256 id, uint256 by, uint256 damag) internal {
        // Implem dodge and crit
        uint256 rand_crit = random(int256(cards[by].properties.bonusCritic));
        uint256 rand_dodge = random(int256(cards[id].properties.dodgeChance));

        if (rand_dodge > CHANCE_APPLY_DODGE) {
            return;
        }

        if (rand_crit > CHANCE_APPLY_CRIT) {
            cards[id].properties.hp -= 2 * int256(damag);
        } else {
            cards[id].properties.hp -= int256(damag);
        }

    }

    /**
     * Do the action of defense. Remove all alteration and give 
     * alteration Defense
     */
    function actionDefend() public onlyFighter() {
        cards[currentFighter].alterations.isInDef = true;
        cards[currentFighter].alterations.turnDefRemaining = getNumberTurnDef(
            currentFighter
        );
        cards[currentFighter].alterations.isInFire = false;
        cards[currentFighter].alterations.isPoisoned = false;
        cards[currentFighter].alterations.isInSoaked = false;
        cards[currentFighter].alterations.isInAir = false;
        removeAlterWater(currentFighter);
        removeAlterAir(currentFighter);

        cards[currentFighter].properties.dodgeChance = getDodgeChanceUp(
            currentFighter
        );
        endTurn();
    }

    /**
     * Check the remaining turn of an alteration
     * @param cond cond
     * @param turnRemain turnRemain
     */
    function checkRemainingTurnAlt(bool cond, uint256 turnRemain)
        internal
        pure
        returns (bool, uint256)
    {
        if (turnRemain != 0) {
            turnRemain -= 1;
        } else {
            cond = false;
        }

        return (cond, turnRemain);
    }

    /**
     * Remove the water alteration
     *  @param id id
     */
    function removeAlterWater(uint256 id) internal {
        cards[cards[id].otherFight].properties.dodgeChance = 0;
    }

    /**
     * Remove the air alteration
     *  @param id id
     */
    function removeAlterAir(uint256 id) internal {
        cards[cards[id].otherFight].properties.bonusCritic = 0;
    }

    /**
     * Decrease the number of alteration turns remaining and apply 
     * alteration
     *  @param id id
     */
    function checkAllAlt(uint256 id) internal {
        if (cards[id].alterations.isInFire) {
            dealDamageTo(
                id,
                cards[id].otherFight,
                getFireTick(cards[id].otherFight)
            );
            (
                cards[id].alterations.isInFire,
                cards[id].alterations.turnFireRemaing
            ) = checkRemainingTurnAlt(
                cards[id].alterations.isInFire,
                cards[id].alterations.turnFireRemaing
            );

        }

        if (cards[id].alterations.isPoisoned) {
            dealDamageTo(
                id,
                cards[id].otherFight,
                getPoisonTick(cards[id].otherFight)
            );
            (
                cards[id].alterations.isPoisoned,
                cards[id].alterations.turnPoisonRemaining
            ) = checkRemainingTurnAlt(
                cards[id].alterations.isPoisoned,
                cards[id].alterations.turnPoisonRemaining
            );
        }

        if (cards[id].alterations.isInSoaked) {
            (
                cards[id].alterations.isInSoaked,
                cards[id].alterations.turnSoakedRemaining
            ) = checkRemainingTurnAlt(
                cards[id].alterations.isInSoaked,
                cards[id].alterations.turnSoakedRemaining
            );
            if (!cards[id].alterations.isInSoaked) {
                removeAlterWater(id);
            }
        }

        if (cards[id].alterations.isInAir) {
            // AIR
            (
                cards[id].alterations.isInAir,
                cards[id].alterations.turnAirRemaining
            ) = checkRemainingTurnAlt(
                cards[id].alterations.isInAir,
                cards[id].alterations.turnAirRemaining
            );
            if (!cards[id].alterations.isInAir) {
                removeAlterAir(id);
            }
        }

    }

    // check alter
    /**
     * Check alterations of both fighters
     */
    function checkAlteration() internal {
        checkAllAlt(currentFighter);
        checkAllAlt(otherFighter);
    }

    // change fighter
    /**
     * End the turn after an undertaken action
     */
    function endTurn() internal {
        checkAlteration();
        if (cards[currentFighter].properties.hp < 0) {
            endGame(otherFighter, currentFighter);
            return;
        }

        if (cards[otherFighter].properties.hp < 0) {
            endGame(currentFighter, otherFighter);
            return;
        }

        uint256 formerOtherFighter = otherFighter;
        otherFighter = currentFighter;
        currentFighter = formerOtherFighter;
        cards[otherFighter].waiting = true;
        cards[currentFighter].waiting = false;
    }

    /**
     * Return the XP to gain after the end of the fight for a given 
     * fighter
     *  @param id id
     */
    function gainXP(uint256 id) internal returns (uint256, uint256) {
        uint256 togain;
        if (isThereDominantFighter) {
            if (cards[id].owner == dominantFighter) {
                togain = XPGAIN / uint256(diffLvl + 1);
            } else {
                togain = XPGAIN * uint256(diffLvl);
            }
        } else {
            togain = XPGAIN;
        }

        if ((cryptomons.getXP(id) + togain) > MAXXP) {
            possibleGain[0] = (cryptomons.getXP(id) + togain) % MAXXP;
        } else {
            possibleGain[0] = togain;
        }

        if ((cryptomons.getXP(id) + togain) >= MAXXP) {
            gainLvl((cryptomons.getXP(id) + togain) / MAXXP);
        }
        return (possibleGain[0], togain);
    }

    /**
     * Return the statistics to gain after a gain of level
     * @param lvlToGain lvlToGain
     */
    function gainLvl(uint256 lvlToGain) internal {
        uint256 atkToGain = 10 * lvlToGain;
        uint256 defToGain = 10 * lvlToGain;

        possibleGain[1] = atkToGain;
        possibleGain[2] = defToGain;
        possibleGain[3] = lvlToGain;
    }

    /**
     * Called when one of the fighter has 0 or less hp. Gives the winner
     * XP and possible gain of level
     * @param winner winner
     * @param looser looser
     */
    function endGame(uint256 winner, uint256 looser)
        internal
        returns (uint256[4] memory)
    {
        hasEnded = true;
        gainXP(winner);
        cryptomons.endFight(address(this), winner, looser);
        hasExpired = true;
    }

    // END TURN TO CHECK ALL ALTERATIONS

    /*
        Getter
        */

    /**
     * 
     *  @param id id
     */
    function getCombatCard(uint256 id)
        public
        view
        returns (
            uint256 _id,
            address payable owner,
            uint256 otherFight,
            // ADD TYPE
            bool waiting
        )
    {
        _id = cards[id].id;
        owner = cards[id].owner;
        waiting = cards[id].waiting;
        otherFight = cards[id].otherFight;

    }

    /**
     * 
     *  @param id id
     */
    function getAlterations(uint256 id)
        public
        view
        returns (
            bool isInFire,
            uint256 turnFireRemaing,
            bool isPoisoned,
            uint256 turnPoisonRemaining,
            bool isInSoaked,
            uint256 turnSoakedRemaining,
            bool isInDef,
            uint256 turnDefRemaining,
            bool isInAir,
            uint256 turnAirRemaining
        )
    {
        isInFire = cards[id].alterations.isInFire;
        turnFireRemaing = cards[id].alterations.turnFireRemaing;
        isPoisoned = cards[id].alterations.isPoisoned;
        turnPoisonRemaining = cards[id].alterations.turnPoisonRemaining;
        isInSoaked = cards[id].alterations.isInSoaked;
        turnSoakedRemaining = cards[id].alterations.turnSoakedRemaining;
        isInDef = cards[id].alterations.isInDef;
        turnDefRemaining = cards[id].alterations.turnDefRemaining;
        isInAir = cards[id].alterations.isInAir;
        turnAirRemaining = cards[id].alterations.turnAirRemaining;
    }

    /**
     * 
     *  @param id id
     */
    function getPropertiesCard(uint256 id)
        public
        view
        returns (
            myLib.Species species,
            myLib.Types typ,
            int256 hp,
            uint256 attack,
            uint256 lvl,
            uint256 def,
            uint256 bonusCritic,
            uint256 dodgeChance,
            uint256 maxhp
        )
    {
        species = cards[id].properties.species;
        typ = cards[id].properties.typ;
        hp = cards[id].properties.hp;
        attack = cards[id].properties.attack;
        lvl = cards[id].properties.lvl;
        def = cards[id].properties.def;
        bonusCritic = cards[id].properties.bonusCritic;
        dodgeChance = cards[id].properties.dodgeChance;
        maxhp = cards[id].properties.maxhp;
    }

    function getExpired() public view returns (bool _hasExpired) {
        _hasExpired = hasExpired;
    }

    function getEnded() public view returns (bool _hasEnded) {
        _hasEnded = hasEnded;
    }

    function getPossibleGain() public view returns (uint256[4] memory pbg) {
        pbg = possibleGain;
    }

    /*
        UTILS
        */
    // Can be hacked. By waiting, the hacker can manipuate the chance

    /**
     * 
     */
    function setProperties(
        uint256 hp,
        uint256 attack,
        uint256 def,
        uint256 lvl,
        myLib.Types typ,
        myLib.Species species
    ) internal pure returns (Properties memory prop) {
        prop.hp = int256(hp);
        prop.maxhp = hp;
        prop.attack = attack;
        prop.def = def;
        prop.lvl = lvl;
        prop.typ = typ;
        prop.species = species;
        prop.dodgeChance = 0;
        prop.bonusCritic = 0;
        return prop;
    }

    function setCard(uint256 id, address payable owner, Properties memory prop)
        internal
        pure
        returns (CombatCard memory cb)
    {
        cb.owner = owner;
        cb.id = id;
        cb.properties = prop;
        return cb;
    }

    /**
     * Random function based on transaction has, the nonce and block
     * timstamp
     * @param boost boost
     */
    function random(int256 boost) internal returns (uint256) {
        uint256 randomnumber = uint256(
            keccak256(abi.encodePacked(now, msg.sender, nonce))
        ) %
            100;
        randomnumber = randomnumber + 1;
        nonce++;

        if (isThereDominantFighter == true && msg.sender == dominantFighter) {
            randomnumber += 10;
        }

        int256 tmp_rd = int256(randomnumber) + boost;
        if (tmp_rd < 0) {
            return 0;
        } else {
            return uint256(tmp_rd);
        }
    }

    /**
     * Max function
     * @param a a
     * @param b b
     */
    function max_f(uint256 a, uint256 b) public pure returns (uint256) {
        if (a >= b) {
            return a;
        } else {
            return b;
        }
    }

    /**
     * Min function
     * @param a a
     * @param b b
     */
    function min_f(uint256 a, uint256 b) public pure returns (uint256) {
        if (a <= b) {
            return a;
        } else {
            return b;
        }
    }

    /**
     * Absolute Value function
     * @param a a
     * @param b b
     */
    function abs(int256 a, int256 b) public pure returns (int256) {
        if ((a - b) >= 0) {
            return a - b;
        } else {
            return b - a;
        }
    }

}
