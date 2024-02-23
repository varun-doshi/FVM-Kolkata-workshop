dasda
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FILERC20 is ERC20, Ownable {

  constructoraddress initialOwner)
        ERC20("FILERC20", "FIL")
        Ownable(initialOwner){}
        
 function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
