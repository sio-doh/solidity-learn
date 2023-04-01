// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Game.sol";

contract Bet {
	Game public game; 
	constructor(address gameAddress) {
		game = Game(gameAddress);
	}
	// calculates the payout of a bet based on the score difference between the two teams
	function calculatePayout(uint amount, int scoreDifference) private pure returns(uint) {
		uint abs = uint(scoreDifference > 0 ? scoreDifference : scoreDifference * -1);	
		uint odds = 2 ** abs;
		if(scoreDifference < 0) {
			return amount + amount / odds;
		}
		return amount + amount * odds;
	}
	function getScoreDifference(Game.Teams teamNumber) public view returns (int256) { 
		if (teamNumber == Game.Teams.Team1) { 
			int256 difference = game.team1Score() - game.team2Score();
			if (difference >= 3) {
				return 3;
			} else if (difference <= -4) {
				return -4;
			} else {
				return difference;
			}
		} else if (teamNumber == Game.Teams.Team2) { 
			int256 difference = game.team2Score() - game.team1Score(); 
			if (difference > 3) { 
				return 3;
			} else if (difference < -4) { 
				return -4;
			} else {
				return difference;
			}
		} else {
			revert("Invalid team number"); 
		}
	}
}