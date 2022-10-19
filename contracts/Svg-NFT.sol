// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract SvgNFT is ERC721URIStorage {
using Counters for Counters.Counter;
Counters.Counter private _tokenIds;

string baseSvg = "";

string[] firstWords = ["YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD"]; 
 
string[] secondWords = ["YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD"];
string[] thirdWords = ["YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD", "YOUR_WORD"];

constructor() ERC721 ("DaviesNFT", "DAVE") {
}

function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
// I seed the random generator. More on this in the lesson.
uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));
// Squash the # between 0 and the length of the array to avoid going out of bounds.
rand = rand % firstWords.length;
return firstWords[rand];
}
function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
uint256 rand = random(string(abi.encodePacked("SECOND_WORD", Strings.toString(tokenId))));
rand = rand % secondWords.length;
return secondWords[rand];
}
function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
uint256 rand = random(string(abi.encodePacked("THIRD_WORD", Strings.toString(tokenId))));
rand = rand % thirdWords.length;
return thirdWords[rand];
}
function random(string memory input) internal pure returns (uint256) {
return uint256(keccak256(abi.encodePacked(input)));
}

function makeSvgNft() public {
    uint256 newItemId = _tokenIds.current();

//     string memory first = pickRandomFirstWord(newItemId);
// string memory second = pickRandomSecondWord(newItemId);
// string memory third = pickRandomThirdWord(newItemId);


// string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));



_safeMint(msg.sender, newItemId);
// Set the NFTs data.
_setTokenURI(newItemId, "data:application/json;base64,ewogICJuYW1lIjogIlRlc3QiLAogICJkZXNjcmlwdGlvbiI6ICJBIG5ldyBORlQgY29sbGVjdGlvbiIsCiAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEQ5NGJXd2dkbVZ5YzJsdmJqMGlNUzR3SWo4K0NqeHpkbWNnZUcxc2JuTTlJbWgwZEhBNkx5OTNkM2N1ZHpNdWIzSm5Mekl3TURBdmMzWm5JaUIyWlhKemFXOXVQU0l4TGpJaUlHSmhjMlZRY205bWFXeGxQU0owYVc1NUlnb2dJQ0FnSUhacFpYZENiM2c5SWpBZ01DQXpNQ0F6TUNJK0NpQWdQR1JsYzJNK1JYaGhiWEJzWlNCVFZrY2dabWxzWlR3dlpHVnpZejRLSUNBOGNtVmpkQ0I0UFNJeE1DSWdlVDBpTVRBaUlIZHBaSFJvUFNJeE1DSWdhR1ZwWjJoMFBTSXhNQ0lnWm1sc2JEMGljbVZrSWk4K0Nqd3ZjM1puUGc9PSIKfQo=");

// Increment the counter for when the next NFT is minted.
_tokenIds.increment();

}

}