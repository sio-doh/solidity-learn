const { assert } = require('chai');
const path = require('path');
const fs = require('fs');
describe('Contract', function () {
    let contract;
    let Contract;
    before(async () => {
        Contract = await ethers.getContractFactory("Contract");
        contract = await Contract.deploy();
        await contract.deployed();
    });

    it('should store the owner', async () => {
        const _owner = await contract.owner.call();
        const [owner] = await ethers.provider.listAccounts();
        assert.equal(_owner, owner);
    });

    it('should have an address payable owner', async () => {
        const fp = path.join(hre.config.paths.artifacts, "contracts", "contract.sol", "Contract.json");
        const {abi} = JSON.parse(fs.readFileSync(fp).toString());
        const ownerFn = abi.find(x => x.name === "owner");
        assert.equal(ownerFn.outputs.length, 1);
        assert.equal(ownerFn.outputs[0].internalType, "address payable");
    });
});