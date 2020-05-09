pragma solidity ^0.4.0;

contract AddressTest {
    function buy() public {
        address payable x = address(0x123);
        address myAddress = address(this);
        if (x.balance < 10 && myAddress.balance >= 10)
            x.transfer(10);
    }
}
