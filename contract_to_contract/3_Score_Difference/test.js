const { assert } = require('chai');
describe('Contract', function () {
    let bet;
    let game;
    before(async () => {
        const Game = await ethers.getContractFactory("Game");
        game = await Game.deploy();
        await game.deployed();

        const Bet = await ethers.getContractFactory("Bet");
        bet = await Bet.deploy(game.address);
        await bet.deployed();
    });

    describe('after adding to score1 three times', () => {
        before(async () => {
            await game.addScore(0);
            await game.addScore(0);
            await game.addScore(0);
        });

        it('should be positive 3 for team1', async () => {
            const diff = await bet.callStatic.getScoreDifference(0);
            assert.equal(diff, 3);
        });

        it('should be negative 3 for team2', async () => {
            const diff = await bet.callStatic.getScoreDifference(1);
            assert.equal(diff, -3);
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

        it('should be negative 2 for team1', async () => {
            const diff = await bet.callStatic.getScoreDifference(0);
            assert.equal(diff, -2);
        });

        it('should be positive 2 for team2', async () => {
            const diff = await bet.callStatic.getScoreDifference(1);
            assert.equal(diff, 2);
        });
    });
});