// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract SubDomainCoin is ERC20, ERC20Permit {
	constructor(
		string memory name,
		string memory symbol,
		uint256 initialSupply
	)
		ERC20(name, symbol)
		ERC20Permit(name)
	{
		_mint(msg.sender, initialSupply);
	}

	// Create a function to mint tokens, only the owner can call this function
	function mint(address to, uint256 amount) public {
		_mint(to, amount);
	}

	// Create a function to burn tokens, only the owner can call this function
	function burn(address from, uint256 amount) public {
		_burn(from, amount);
	}
}
