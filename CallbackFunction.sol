pragma solidity ^0.4.0;

contract CallbackFunction {
    address payable public owner;
    //can accept ether
    function() paybale external {
    }
    //transfer balance to owner
    function withdrawEther(uint256 amount) public {
        if (msg.sender != owner) revert();
        owner.transfer(amount);
    }
}
