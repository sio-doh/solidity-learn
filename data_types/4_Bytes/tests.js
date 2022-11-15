const { assert } = require('chai');
describe('Contract', function () {
    let contract;
    before(async () => {
        const Contract = await ethers.getContractFactory("Contract");
        contract = await Contract.deploy();
        await contract.deployed();
    });
    
    it('should create a 2 byte string a', async () => {
        const a = await contract.callStatic.a();
        assert(/^0x[0-9a-f]{4}$/.test(a));
    });

    it('should create a 2 byte string b', async () => {
        const b = await contract.callStatic.b();
        assert(/^0x[0-9a-f]{4}$/.test(b));
    });

    it('should create a 2 byte string cafe', async () => {
        const cafe = await contract.callStatic.cafe();
        assert.equal(cafe, "0xcafe");
    });
});