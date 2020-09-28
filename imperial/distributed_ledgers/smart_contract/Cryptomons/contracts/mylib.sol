/**
 * Created on 2020-02-16 18:18
 * @summary: .
 * @author: syndorik
 */
pragma solidity ^0.6.1;

library myLib {
    enum Species {BULBASAUR, CHARMANDER, SQUIRTLE, PIDGEY}
    enum Types {PLANT, FIRE, WATER, AIR}

    /**
     * Get the type matchup. If -1 is returned, there are no dominant
     * fighter
     */
    function getMatchUp(uint256 _a, uint256 _b, uint256 ta, uint256 tb)
        public
        pure
        returns (int256 winner)
    {
        Types a = Types(ta);
        Types b = Types(tb);
        if (a == Types.FIRE) {
            if (b == Types.WATER) {
                return int256(_a);
            } else if (b == Types.AIR) {
                return int256(_b);
            } else {
                return -1;
            }

        } else if (a == Types.WATER) {
            if (b == Types.PLANT) {
                return int256(_a);
            } else if (b == Types.FIRE) {
                return int256(_b);
            } else {
                return -1;
            }

        } else if (a == Types.AIR) {
            if (b == Types.FIRE) {
                return int256(_a);
            } else if (b == Types.PLANT) {
                return int256(_b);
            } else {
                return -1;
            }

        } else {
            if (b == Types.AIR) {
                return int256(_a);
            } else if (b == Types.WATER) {
                return int256(_b);
            } else {
                return -1;
            }

        }
    }

    /**
     * Max function
     */
    function max_f(uint256 a, uint256 b) public pure returns (uint256) {
        if (a >= b) {
            return a;
        } else {
            return b;
        }
    }

}
