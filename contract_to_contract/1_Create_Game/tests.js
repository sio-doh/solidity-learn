const { assert } = require('chai');
describe('Contract', function () {
    let game;
    before(async () => {
        const Game = await ethers.getContractFactory("Game");
        game = await Game.deploy();
        await game.deployed();
    });

    describe('after adding to to team 1s score three times', () => {
        before(async () => {
            await game.addScore(0);
            await game.addScore(0);
            await game.addScore(0);
        });

        it('should be 3 to 0', async () => {
            const team1Score = await game.callStatic.team1Score();
            assert.equal(team1Score, 3);
            const team2Score = await game.callStatic.team2Score();
            assert.equal(team2Score, 0);
        });
    });

    describe('after adding to score2 five times', () => {
        before(async () => {
            await game.addScore(1);
            await game.addScore(1);
            await game.addScore(1);
            await game.addScore(1);
            await game.addScore(1);
        });

        it('should be 3 to 5', async () => {
            const team1Score = await game.callStatic.team1Score();
            assert.equal(team1Score, 3);
            const team2Score = await game.callStatic.team2Score();
            assert.equal(team2Score, 5);
        });
    });
});