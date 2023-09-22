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

    function addAdmin(address _address) public {
        require(owner == msg.sender);
        require(nextUnusedAdminSlot < 3);
        updateAdmin(contractAdmins, nextUnusedAdminSlot, _address);
        nextUnusedAdminSlot = nextUnusedAdminSlot + 1;
    }

    function removeAdminBySlot(uint8 _adminSlot) public {
        require(owner == msg.sender);
        require(_adminSlot < 3);
        clearArraySlot(contractAdmins, _adminSlot);
    }

    function updateAdmin(address[3] storage _admins,
                        uint8 _adminId,
                        address _newAdminAddress) internal {
        _admins[_adminId] = _newAdminAddress;
    }

    function destroy() public {
        selfdestruct(msg.sender); 
    }
}
