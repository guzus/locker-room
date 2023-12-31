// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import "../src/LockerRoomUserContract.sol";
import "../src/LockerRoom.sol";

contract LockerRoomTest is Test {
    LockerRoom public lockerRoom;
    LockerRoomUserContract public lockerRoomUserContract;

    function setUp() public {
        lockerRoom = new LockerRoom();
        lockerRoomUserContract = new LockerRoomUserContract(address(lockerRoom), address(this));
        bytes memory data = abi.encodeWithSignature("someFunction(uint256,uint256,address,bytes)", 1, 2, address(this), bytes("gm"));
        lockerRoom.registerCalldata(1, data);
    }

    function testCallByRawCalldata() public {
        vm.prank(0x0000000000000000000000000000000000000000);
        lockerRoomUserContract.someFunction(1, 2, address(this), bytes("gm"));
    }

    function testCallByCode() public {
        vm.prank(0x0000000000000000000000000000000000000000);
        lockerRoomUserContract.callByCode(1);
    }
}
