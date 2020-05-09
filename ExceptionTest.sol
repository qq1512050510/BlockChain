pragma solidity ^0.4.0;

contract ExceptionTest {
    //检查内部计算是否会溢出
    function add(uint256 a, uint256 b) internal pure returns (uint256){
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function send() payable public returns (uint balance){
        require(msg.value % 2 == 0);
        // 只允许偶数
        return msg.value;
    }

    function buy(unit amount) payable public {
        if (amount > msg.value / 2 ether)
            revert("Not enough Ether provided.");
    }
}
