const hre = require("hardhat");
async function main() {
  const NftMarketplace = await hre.ethers.getContractFactory("NFTMarketplace");
  const nftmarketplace = await NftMarketplace.deploy();

  await nftmarketplace.waitForDeployment();
  const address = await nftmarketplace.getAddress();

  console.log(`deployed contract address ${address}`);

  const Profile = await hre.ethers.getContractFactory("Profile");
  const profile = await Profile.deploy();
  await profile.waitForDeployment();
  console.log("Profile contract deployed at:", await profile.getAddress());

  // Deploy Subscription
  // const Subscription = await hre.ethers.getContractFactory("Subscription");
  // const subscription = await Subscription.deploy();
  // await subscription.waitForDeployment();
  // console.log(
  //   "Subscription contract deployed at:",
  //   await subscription.getAddress()
  // );
}

main().catch((error) => {
  const hre = require("hardhat");

  async function main() {
    try {
      const NftMarketplace = await hre.ethers.getContractFactory(
        "NFTMarketplace"
      );
      const nftmarketplace = await NftMarketplace.deploy();

      await nftmarketplace.waitForDeployment();
      const nftMarketplaceAddress = await nftmarketplace.getAddress();

      console.log(
        `NFTMarketplace contract deployed at: ${nftMarketplaceAddress}`
      );

      const Profile = await hre.ethers.getContractFactory("Profile");
      const profile = await Profile.deploy();
      await profile.waitForDeployment();
      console.log("Profile contract deployed at:", await profile.getAddress());

      // Deploy Subscription
      const Subscription = await hre.ethers.getContractFactory("Subscription");
      const subscription = await Subscription.deploy();
      await subscription.waitForDeployment();
      console.log(
        "Subscription contract deployed at:",
        await subscription.getAddress()
      );
    } catch (error) {
      console.error(error);
      process.exitCode = 1;
    }
  }

  main();
  console.error(error);
  process.exitCode = 1;
});
