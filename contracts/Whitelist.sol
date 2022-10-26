// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    // max number of whitelisted address allowed
    // uint8 - 0-255 and max should be 100addresses
    uint8 public maxWhitelistedAddresses;

    // create a mapping of whitelisted addresses
    // if an address is whitelisted, set it to  true, default should be false
    mapping(address => bool) public whitelistedAddresses;

    // Track of whitelisted Address - for verfication purpose
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // it should add address to whitelist
    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}