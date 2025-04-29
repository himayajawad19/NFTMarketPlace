const hre = require("hardhat");
async function main() {
  const NftMarketplace = await hre.ethers.getContractFactory("NFTMarketplace");
  const nftmarketplace = await NftMarketplace.deploy();

  await nftmarketplace.waitForDeployment();
  const address = await nftmarketplace.getAddress();

  console.log(`deployed contract address ${address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
