# BlockChain
solidity 教程 By Chiang
#基础语法
* 1、Version Pragma
>Version Pragma定义代码使用的Solidity编译器版本的生命。
```
pragma solidity >=0.4.22 <0.7.0;
```
* 2、导入其他源文件
>全局级别，可以使用`import`语句
````
import "filename";
````
* 3、注释
>//但行注释\
>/*\
>   多行注释\
>*/
##数据类型
* address，ETH地址长度，20个字节
* int/uint 变长的有符号或无符号整型。支持8倍递增，uint8到unit256，unit默认为unit256.
* bool 布尔类型
* mapping 键值对映射，例如`mapping(address=>uint)`
* struct 结构体，如下例子：`struct Solidity{address addr,uint amount}`
>* storage - 永久存储，费用相对要高
>* memory - 临时变量存储，费用较低
>变量定义时默认为storage永久存储，而作为函数参数时，默认为memory，临时存储。
## 访问权限修饰符
### public与private 
* `public`修饰的变量和函数，任何用户或者合约都能调用和访问。
* `private`修饰的变量和函数，只能在其所在的合约中调用和访问，即使是其子合约也没有权限访问。
### external与internal
* `external`与`public`类似，只不过这些函数只能在**合约之外调用**，不能被合约内函数调用。
* `internal`与`private`类似, 不过，如果某个合约继承自父合约，这个合约可以访问父合约定义的**内部**函数，也可以访问子合约的函数。
> internal、private、external、public这4种关键字都是可见性修饰符，互不共存。