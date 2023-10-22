// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "solmate/auth/Owned.sol";
import "./LockerRoom.sol";

contract LockerRoomUserContract is Owned {
    LockerRoom public lockerRoom;

    constructor(address _lockerRoom, address _owner) Owned(_owner) {
        lockerRoom = LockerRoom(_lockerRoom);
    }

    function callByCode(uint8 code) external {
        bytes memory data = LockerRoom(lockerRoom).getCalldata(code);
        address(this).delegatecall(data);
    }

    function callByCodeAndSuffix(uint8 code, bytes calldata suffix) external {
        bytes memory data = LockerRoom(lockerRoom).getCalldata(code);
        address(this).delegatecall(abi.encodePacked(data, suffix));
    }

    function someFunction(uint256 a, uint256 b, address c, bytes calldata d) public {
        // do something
    }

    // only accessible by admin is heavily recommended

    function updateLockerRoom(address newLockerRoom) external onlyOwner {
        lockerRoom = LockerRoom(newLockerRoom);
    }

    function addCode(uint8 code, bytes calldata data) external onlyOwner {
        LockerRoom(lockerRoom).registerCalldata(code, data);
    }
}
