pragma solidity ^0.4.0;

contract Modifiers {
    function Modifiers(){

    }

    address public sender;
    constructor() public {
        //创建合约时将合约创建者赋值给sender
        sender = msg.sender;
    }
    modifier onlyOwner(){
        //如果嗲用合约的人不是合约创建者则throw
        if (msg.sender != sender) revert();
        _;
        //占位符
    }
    //这样a函数只能被合约的创建者调用
    function a() onlyOwner public {

    }
}
