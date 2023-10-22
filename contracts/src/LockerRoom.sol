// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract LockerRoom {
    mapping (address => mapping(uint8 => bytes)) public locker;

    function registerCalldata(uint8 code, bytes calldata data) public payable {
        require(locker[msg.sender][code].length == 0, "LockerRoom: already occupied");
        locker[msg.sender][code] = data;
    }
}
