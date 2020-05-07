pragma solidity ^0.4.0;
/*
* 创建长度为lenth的memory类型的数组可以通过new关键字来创建。
memory数组一旦创建，不可以通过length修改其长度。
* memory类型的固定长度的数组不可直接赋值给storage/memory类型的可变数组。
* memory的变长数组不支持push()

*/

contract MemoryArrays {
    function MemoryArrays(){
    }

    function setTLength() public pure returns (uint length){
        unint[] memory T1 = new uint[](1);
        T1[0] = 1;
        return T1[0];
    }
}
