// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/LockerRoomUserContract.sol";
import "../src/LockerRoom.sol";

contract LockerRoomTest is Test {
    LockerRoom public lockerRoom;
    LockerRoomUserContract public lockerRoomUserContract;

    function setUp() public {
        lockerRoom = new LockerRoom();
        lockerRoomUserContract = new LockerRoomUserContract(lockerRoom);
    }

    function testCallByRawCalldata() public {
        lockerRoom.someFunction(1, 2, address(this), 0x12345678);
    }

    function testCallByCode() public {
        bytes memory data = abi.encodeWithSignature("someFunction(uint256,uint256,address,bytes)", 1, 2, address(this), 0x12345678);
        lockerRoom.registerCalldata(1, data);
        lockerRoomUserContract.callByCode(1);
    }
}
