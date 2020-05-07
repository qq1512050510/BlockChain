pragma solidity ^0.4.0;

contract FixedList {
    uint [5] T = [1,2,3,4,5];
    function setTLength(uint len) public {
        T.length = len;
        T.push(6);
    }
    function FixedList(){

    }
}
