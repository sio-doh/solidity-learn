const { assert } = require('chai');
describe('Bet', function () {
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

    it('should store the game address', async () => {
        const gameAddress = await bet.callStatic.game();
        assert.equal(gameAddress, game.address);
    });
});