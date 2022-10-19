// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Svgnft = await hre.ethers.getContractFactory("SvgNFT");
  const nft = await Svgnft.deploy();

  await nft.deployed();

  console.log(`SVG NFT deployed to ${nft.address}`);

  let mint = await nft.makeSvgNft();
  let receipt = mint.wait();

  console.log("Receipt: ", receipt);
  // SVG NFT deployed to 0x9527DD295a2e3D4e7b8e8bABB75Cd3342c034705
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// https://testnets.opensea.io/0x3369613363d50969951c03cC365c2596C1D8aDDA
