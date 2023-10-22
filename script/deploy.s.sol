pragma solidity ^0.8.4;

import "forge-std/Script.sol";
import "../src/LockerRoom.sol";
import "../src/LockerRoomUserContract.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address publicKey = vm.envAddress("PUBLIC_KEY");
        vm.startBroadcast(privateKey);
        LockerRoom lockerRoom = new LockerRoom();
        LockerRoomUserContract lockerRoomUserContract = new LockerRoomUserContract(address(lockerRoom), publicKey);
        lockerRoomUserContract.addCode(1, abi.encodeWithSignature("someFunction(uint256,uint256,address,bytes)", 1, 2, address(this), bytes("gm")));
        lockerRoomUserContract.callByCode(1);
        lockerRoomUserContract.someFunction(1, 2, address(this), bytes("gm"));
        vm.stopBroadcast();
    }
}
