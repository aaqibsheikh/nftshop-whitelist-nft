const { ethers } = require("hardhat");

async function main() {
  const whitelistContract = await ethers.getContractFactory("Whitelist");
  const deployWhitelistContract = await whitelistContract.deploy(11); // 11 is the Maximum number of whitelisted addresses allowed
  await deployWhitelistContract.deployed();

  console.log("Whitelist contract address", deployWhitelistContract.address)

}

main().then(() => {
  process.exit(0);
}).catch(error => {
  console.error(error);
  process.exit(1);
})