// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ArcadeGame {
    function scores() external returns(uint, uint, uint);
}

contract Leaderboard {
	uint public highscore;
    
    function addGame(address gameAddress) external {
        ArcadeGame game = ArcadeGame(gameAddress); 
        uint score1;
        uint score2;
        uint score3;
        (score1, score2, score3) = game.scores();
        if (score1 > highscore) {
            highscore = score1;
        } 
        if (score2 > highscore) {
            highscore = score2;
        } 
        if (score3 > highscore) {
            highscore = score3;
        }
    }
}