pragma solidity ^0.6.4;
// SPDX-License-Identifier: MIT
contract HotalRoomBooking{
    enum RoomStatus {Free, Reserved}
    RoomStatus CurrentStatus;
    address payable  buyer;
    address payable  owner;
    uint CurrentTime;
    uint NoOfDays;
    event Registration(address Sender, address Receiver, uint amount, RoomStatus present);
    event Cancel (address Sender, address Receiver, uint refund, RoomStatus present);
    
    

    constructor() public{
       buyer = msg.sender;
       CurrentStatus = RoomStatus.Free;
       owner = 0x4337f45A13abC2BC378fa1c83F5D600C53DF6411;
       CurrentTime = now;
    }

    function Makepayment(uint Days) public payable{

        require (1 ether <= buyer.balance, "Insufficient Funds");
        owner.transfer(1 ether);
        CurrentStatus = RoomStatus.Reserved;
        emit Registration(buyer,owner,1 ether,CurrentStatus);
        NoOfDays= Days;
     }

    function Cancellation() public payable{
    
    CurrentStatus = RoomStatus.Free;
    uint difference = NoOfDays*60*60*24 - now + CurrentTime;
    if (difference > 7 days ){
        buyer.transfer(1 ether);
        emit Cancel(owner,buyer,1 ether,CurrentStatus);
    }
    else if (7 days > difference && difference >2 days){
       buyer.transfer(0.5 ether);
       emit Cancel(owner,buyer,0.5 ether,CurrentStatus);
    }
    else {
        buyer.transfer(0 ether);
        emit Cancel(owner,buyer,0 ether,CurrentStatus);
    }

}
}
