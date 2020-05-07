pragma solidity >=0.4.22 <0.6.0;
contract HelloWorld{
    uint[] T1;
    function setTLength() public returns (uint length){
        T1.push(1);
        T1.length++;
        T1[1] = 2;
        return T1[1];
    }
}