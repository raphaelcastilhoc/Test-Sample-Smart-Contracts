// SPDX-License-Identifier: Unlicense
pragma solidity 0.4.22;
contract Example {
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

    function loopedExternalCalls(int amount, address[] destinations) external {
        for (uint i=0; i < destinations.length; i++) {
            destinations[i].transfer(amount);
        }
    }

    function fundingReached() public returns(bool) {
        return this.balance == 100 ether;
    }
    
    function buyMultipleNFTs(uint256 numNFTs) external payable {
        for (uint i = 0; i < numNFTs; i++) {
            if (msg.value < 1 ether) {
            revert("Insufficient payment");
            }
            nftOwners[nextNftId] = buyer;
            nextNftId =+ 1;
        }
    }

    function reserveTokens() public payable {
        uint256 weiSent = msg.value;
        uint256 reservationAmount;
        assembly {
            reservationAmount := shl(weiSent, 2)
        }
        reservations[msg.sender] = reservationAmount;
    }

    function setTokenPrice(uint256 _updatedPrice) public {
        require(owner == msg.sender);
        currentTokenPrice = _updatedPrice;
    }

function badReentrancy() public {
        msg.sender.transfer(1);
        paidOut += 1; 
    }

    function badUpdateOwner() public {
        require(tx.origin == owner); 
        owner = msg.sender;
    }

function coinFlip(bool _guess) public returns (bool) {
        uint256 coinFlip = uint256(blockhash(block.number - 1)) / 99;
        bool side = coinFlip == 1 ? true : false;
        if (side == _guess) {
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
    }
}
