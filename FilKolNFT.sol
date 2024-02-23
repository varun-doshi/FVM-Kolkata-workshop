// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract FilKolNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds; //just a counter to keep track of how many NFTs eg 1,2,3,4 ....

		// this is just so we can see all the NFTs minted by this contract
    struct myNFT {
        address owner;
        string tokenURI;
        uint256 tokenId;
    }
    
		// this is the collection of all NFTs with the above myNFT variables (owner, tokenURI & tokenId)
    myNFT [] public nftCollection;

		//this initalises the NFT contract when we deploy it
    constructor() ERC721 ("Kolkata Workshop", "Filecoin Starter NFTs") {
        console.log("This is my NFT contract");
    }

    function mintMyNFT(string memory ipfsURI) public {
        uint256 newItemId = _tokenIds.current(); //basically we just count from 0 to however many NFTs to give it a tokenID

        myNFT memory newNFT = myNFT ({
            owner: msg.sender,
            tokenURI: ipfsURI,
            tokenId: newItemId
        });

				//msg.sender is the wallet that calls the function and therefore the owner of this nft
        _safeMint(msg.sender, newItemId);
    
				//we're giving our NFT an image here from ipfs
        _setTokenURI(newItemId, ipfsURI);
    
        _tokenIds.increment();

        nftCollection.push(newNFT);
    }

    function getNFTCollection() public view returns (myNFT [] memory) {
        return nftCollection;
    }
}
