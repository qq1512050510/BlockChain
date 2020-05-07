pragma solidity ^0.4.0;

contract StorageMemory {
    string public a;

    function StorageMemory(){
        a = "abc";
    }

    function updateNum() public {
        changeNum(a);
    }
    //function changNum(string storage aa) internal{
    function changeNum(string memory aa) internal {
        aa = "d";
    }
}
