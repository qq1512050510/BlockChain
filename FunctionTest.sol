pragma solidity >=0.4.22 <0.6.0;

contract FunctionTest {
    uint public age;

    function FunctionTest(){
    }

    function constantViewPure() public {
        age = 29;
    }
    function getAgeByView() public view returns(uint){
        //age += 1; //编译器报错
        return age;
    }
    function getAgeByPure() public pure returns(uint){
        //return age; //编译器报错
        return 1;
    }
}
