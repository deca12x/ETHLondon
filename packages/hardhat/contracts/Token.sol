// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract SubToken is ERC20, ERC20Permit {
	constructor() ERC20("SubTeams", "SUB") ERC20Permit("SubTeams") {
		// Filling team members
		teams["core"] = [address(0x1), address(0x2), address(0x3)];
		teams["software"] = [address(0x4), address(0x5), address(0x6)];
		teams["legal"] = [address(0x7), address(0x8), address(0x9)];
		teams["finance"] = [address(0xA), address(0xB), address(0xC)];
		teams["marketing"] = [address(0xD), address(0xE), address(0xF)];

		// Mint tokens to all team members
		for (uint i = 0; i < 5; i++) {
			string memory teamName = teamNames[i];
			for (uint j = 0; j < teams[teamName].length; j++) {
				_mint(teams[teamName][j], 1000 * (10 ** decimals()));
			}
		}
	}

	mapping(string => address[]) public teams;
	string[5] teamNames = ["core", "software", "legal", "finance", "marketing"];

	// Custom modifier to restrict minting and burning to 'core' team
	modifier onlyCoreTeam() {
		require(
			isCoreTeamMember(msg.sender),
			"Only core team can mint or burn"
		);
		_;
	}

	function isCoreTeamMember(address _member) public view returns (bool) {
		for (uint i = 0; i < teams["core"].length; i++) {
			if (_member == teams["core"][i]) return true;
		}
		return false;
	}
}
