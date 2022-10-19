const hre = require("hardhat");

async function main() {
  const contractAddr = "0xea2b9b460f737e58caded3a07850165155a7d13c";
  const b = await hre.ethers.getContractAt("B", contractAddr);

  //   console.log(`SVG NFT deployed to ${nft.address}`);

  let mint = await b.getInfo();
  let receipt = mint.wait();

  console.log("mint: ", mint);
  console.log("Receipt: ", receipt);
  // SVG NFT deployed to 0x9527DD295a2e3D4e7b8e8bABB75Cd3342c034705
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
