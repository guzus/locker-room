// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LockerRoomUserContract {
    address public lockerRoom;

    function callByCode(uint8 code) {
        bytes memory data = LockerRoom(lockerRoom).getCalldata(code);
        address(this).delegatecall(data);
    }

    function callByCodeAndSuffix(uint8 code, bytes suffix) {
        bytes memory data = LockerRoom(lockerRoom).getCalldata(code);
        address(this).delegatecall(abi.encodePacked(data, suffix));
    }

    // acccess only by admin is heavily recommended
    function updateLockerRoom(address newLockerRoom) {
        lockerRoom = newLockerRoom;
    }

    function someFunction(uint256 a, uint256 b, address c, bytes calldata d) {
        // do something
    }
}
