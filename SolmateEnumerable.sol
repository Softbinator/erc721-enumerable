// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./SolmateERC721.sol";

contract SolmateEnumerable is SolmateERC721 {
    uint256 totalSupply;

    constructor(string memory _name, string memory _symbol) SolmateERC721(_name, _symbol) {}

    function mint(address _owner, uint256 _tokenId) external {
        _mint(_owner, _tokenId);
    }

    function testOwnerOf(address _owner) external returns (uint256[] memory) {
        return tokensOfOwner(_owner);
    }

    function tokensOfOwner(address _owner) public view returns (uint256[] memory) {
        uint256 balance = balanceOf[_owner];
        uint256[] memory tokens = new uint256[](balance);
        uint256 index;
        unchecked {
            for (uint256 i; i < totalSupply; i++) {
                if (ownerOf[i] == _owner) {
                    tokens[index] = uint256(i);
                    index++;
                }
            }
        }
        return tokens;
    }

    function tokenURI(uint256 id) public view override returns (string memory){
        return "";
    }
}
