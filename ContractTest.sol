pragma solidity ^0.4.0;

contract ContractTest {
    function destroy(address payable x) public {
        //销毁合约并把所有资金发送到给定的地址
        selfdestruct(x);
    }
}
