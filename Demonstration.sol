// SPDX-License-Identifier: Unlicense
pragma solidity 0.4.22;
contract Demonstration {
    address[] public users;
    address public owner;
    address[3] public contractAdmins;
    uint8 public nextUnusedAdminSlot = 0;
    mapping(address => uint256) public reservations;
    uint256 public tokenPrice; 
    mapping (uint256 => address) public nftOwners;
    uint256 public nextNftId = 0;
    uint256 public paidOut = 0;

    constructor() public {
        users.push(msg.sender);
        owner = msg.sender;
    }

    function badReentrancy() public {
        msg.sender.transfer(1);
        paidOut += 1; 
    }

    function badUpdateOwner() public {
        require(tx.origin == owner); 
        owner = msg.sender;
    }
    
    function destroy() public {
        selfdestruct(msg.sender); 
    }
}