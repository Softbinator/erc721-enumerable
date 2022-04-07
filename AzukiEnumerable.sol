// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ERC721A.sol";

contract AzukiEnumerable is ERC721A {
    constructor(string memory _name, string memory _symbol) ERC721A(_name, _symbol) {}

    function mint(address _owner, uint256 _tokenId) external {
        _mint(_owner, 1, "", false);
    }

    function testOwnerOf(address _owner) external returns (uint256[] memory) {
        return tokensOfOwner(_owner);
    }

    function tokensOfOwner(address _owner) public view returns (uint256[] memory) {
        uint256 balance = balanceOf(_owner);
        uint256[] memory tokens = new uint256[](balance);
        uint256 index;
        unchecked {
            uint256 totalSupply = totalSupply();
            for (uint256 i; i < totalSupply; i++) {
                if (ownerOf(i) == _owner) {
                    tokens[index] = uint256(i);
                    index++;
                }
            }
        }
        return tokens;
    }
}
