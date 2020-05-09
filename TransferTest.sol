pragma solidity ^0.4.0;

contract TransferTest {
    address payable public winner;
    function sendToWinner(uint256 winAmount) public{
        winner.send(winAmount);
        winner.transfer(winAmount);
        winner.call.value(winAmount);
    }
}
