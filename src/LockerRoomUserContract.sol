// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "solmate/auth/Owned.sol";

contract LockerRoomUserContract is Owned {
    address public lockerRoom;

    constructor(address _lockerRoom) {
        lockerRoom = _lockerRoom;
    }

    function callByCode(uint8 code) {
        bytes memory data = LockerRoom(lockerRoom).getCalldata(code);
        address(this).delegatecall(data);
    }

    function callByCodeAndSuffix(uint8 code, bytes suffix) {
        bytes memory data = LockerRoom(lockerRoom).getCalldata(code);
        address(this).delegatecall(abi.encodePacked(data, suffix));
    }

    function someFunction(uint256 a, uint256 b, address c, bytes calldata d) {
        // do something
    }

    // only accessible by admin is heavily recommended

    function updateLockerRoom(address newLockerRoom) onlyOwner {
        lockerRoom = newLockerRoom;
    }

    function addCode(uint8 code, bytes calldata data) onlyOwner {
        LockerRoom(lockerRoom).registerCalldata(code, data);
    }
}
