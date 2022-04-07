// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract OZEnumerable is ERC721Enumerable {
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    function mint(address _owner, uint256 _tokenId) external {
        _mint(_owner, _tokenId);
    }

    function testOwnerOf(address _owner) external returns (uint256[] memory) {
        return tokensOfOwner(_owner);
    }

    function tokensOfOwner(address _owner) public view returns (uint256[] memory) {
        uint256 tokenCount = balanceOf(_owner);
        if (tokenCount == 0) {
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 index;
            for (index; index < tokenCount; index++) {
                result[index] = tokenOfOwnerByIndex(_owner, index);
            }
            return result;
        }
    }
}
