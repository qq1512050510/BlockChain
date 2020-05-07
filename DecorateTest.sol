pragma solidity ^0.4.0;

contract DecorateTest {
    function DecorateTest(){
    }

    function publicFunc() public {}

    function callFunc() public {
        // 以 internal 的方式调用函数
        publicFunc();
        // 以external的方式调用函数
        this.publicFunc();
    }

    function internalFunc() internal {}

    function externalFunc() external {}
}

contract HelloWorld {
    function externalCall(DecorateTest test) public {
        //调用另一个合约的外部函数
        test.publicFunc();
        test.externalFunc();
        //test.internalFunc();调用失败，无法调用internal函数
    }
}
