// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MyToken is ERC20, ERC20Permit, ERC20Votes {
	constructor() ERC20("SubTeams", "SUB") ERC20Permit("SubTeams") {
        // Filling team members
        teams['core'] = [address(0x1), address(0x2), address(0x3)];
        teams['software'] = [address(0x4), address(0x5), address(0x6)];
        teams['legal'] = [address(0x7), address(0x8), address(0x9)];
        teams['finance'] = [address(0xA), address(0xB), address(0xC)];
        teams['marketing'] = [address(0xD), address(0xE), address(0xF)];

        // Mint tokens to all team members
        for (string memory teamName in ['core', 'software', 'legal', 'finance', 'marketing']) {
            for (address member : teams[teamName]) {
                _mint(member, 1000 * (10 ** decimals()));
            }
        }
    }

    mapping(string => address[]) public teams;

    // Custom modifier to restrict minting and burning to 'core' team
    modifier onlyCoreTeam() {
        require(isCoreTeamMember(msg.sender), "Only core team can mint or burn");
        _;
    }

    function isCoreTeamMember(address _member) public view returns(bool) {
        for (address member : teams['core']) {
            if (_member == member) return true;
        }
        return false;
    }

    // Overrides
    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes) onlyCoreTeam {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount) internal override(ERC20, ERC20Votes) onlyCoreTeam {
        super._burn(account, amount);
    }

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }
}




  // mapping(string => address) public teamMembers;
