// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LockerRoom {
    mapping (address => mapping(uint8 => bytes)) public locker;

    function registerCalldata(uint8 code, bytes calldata data) public payable {
        require(locker[msg.sender][code].length == 0, "LockerRoom: already occupied");
        locker[msg.sender][code] = data;
    }

    function getCalldata(uint8 code) public view returns (bytes memory) {
        return locker[msg.sender][code];
    }
}
