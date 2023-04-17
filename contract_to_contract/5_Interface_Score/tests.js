const { assert } = require('chai');
describe('Leaderboard', function () {
    let leaderboard;
    let game;
    before(async () => {
        const Leaderboard = await ethers.getContractFactory("Leaderboard");
        leaderboard = await Leaderboard.deploy();
        await leaderboard.deployed();
    });

    describe('after a low scoring game', () => {
        before(async () => {
            const GameContract = await ethers.getContractFactory("GameContract");
            game = await GameContract.deploy(3, 5, 4);
            await game.deployed();
        });

        it('should take the highest score', async () => {
            await leaderboard.addGame(game.address);
            const highscore = await leaderboard.callStatic.highscore();
            assert.equal(highscore, 5);
        });
    });

    describe('after a higher scoring game', () => {
        before(async () => {
            const GameContract = await ethers.getContractFactory("GameContract");
            game = await GameContract.deploy(5, 10, 9);
            await game.deployed();
        });

        it('should take the highest score', async () => {
            await leaderboard.addGame(game.address);
            const highscore = await leaderboard.callStatic.highscore();
            assert.equal(highscore, 10);
        });
    });

    describe('after a third lower scoring game', () => {
        before(async () => {
            const GameContract = await ethers.getContractFactory("GameContract");
            game = await GameContract.deploy(5, 4, 6);
            await game.deployed();
        });

        it('should hold the previous highest score', async () => {
            await leaderboard.addGame(game.address);
            const highscore = await leaderboard.callStatic.highscore();
            assert.equal(highscore, 10);
        });
    });
});