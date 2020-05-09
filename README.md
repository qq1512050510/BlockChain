# BlockChain
solidity 教程 By JiangYP
# 基础语法
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
>//单行注释\
>/*\
>   多行注释\
>*/
## 数据类型
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

## 函数定义
* 在Solidity v4.17之前，只有`constant`，由于constant也代表变量中常量的意思，所以constant拆成了view和pure
* 当函数有返回值是，可以添加三种定义，用三种方式定义的函数都只执行那个读操作，不会进行编译执行。用这三种方式地难以的函数，不会执行函数里的逻辑，\
只会执行一个返回的读操作。所以执行这些函数不需要消耗gas费用
* view的作用和constant一模一样，可以读取状态变量，但是不能改变量。
* pure则更为严格，pure修饰的函数不能改也不能读变量的状态，否则编译通不过。

> ```
> `FunctionTest`
> ```
补充：
view与pure使用场景
* view：可以自由调用，因为它只是“查看”区块链的状体而不改变它
* pure：也可以自由调用，既不读取也不写入区块链。
view与pure的原理（问题）
* view：要读取区块链上的内容，为什么不消耗gas？
* pure：不读取更不修改区块链上的变量，使本机的CPU资源计算我们的函数，所以不消耗任何资源。
### 函数修饰符
* 修改器（Modifiers）可以用来轻易的改变一个函数的行为。比如用于在函数执行前检查某种前置条件。

### 构造函数
构造函数是特殊的函数，在部署合约的时候，就会被调用。常常用于对某一些状态变量的初始化。
>* 老版本的solidity编译器中，构造函数和合约的名字同名
>* 新版本的solidity编译器中，使用关键字constructor作为构造函数
### 回退函数
* fallback function回退函数，每一个合约有且仅有一个没有名字的函数，往合约发送消息时，会执行该函数。如果合约要正常接受ether，\
需要加上payable声明。声明后，当有用户往合约转账时，将触发该函数，可以在里面写相应的逻辑。
1. 当外部账户或其他合约向该合约地址发送ether时；
2. 当外部账户或其他合约调用了该合约一个**不存在**的函数时。
>CallbackFunction
### 异常处理
* 使用状态恢复来处理异常，就是说当抛出异常时将恢复到调用前的状态。抛出异常的方式有assert，require，revert，throw。
>* assert函数，用于条件检查，只能检测内部错误和检查常量。
>* require函数，也是条件检查，用于测试调用的输入或者合约状态变量。
>* revert函数用于标记错误并恢复当前调用。
>* throw和revert一样，但是throw在0.4.13被弃用，将来会淘汰。

### 地址相关
* 以太坊地址的长度大小是20个字节，使用uint160(8*20)来存储的，而且他们之间可以相互强制转换：
````
address payable ap = address(uint160(addr));
````
* 地址之间是可以直接比较大小：<=,<,>=,>,==,!=
* 地址类型有两种形式，他们大致相同：
address：保存一个20字节的值（以太坊地址的大小）。
address payable：可支付地址，与address相同，不过有成员函数transfer和send。
### 合约相关
* this(当前合约的类型):
表示当前合约，可以显式的转换为Address
* selfdestruct(address recipient):
销毁当前合约，并把它所有资金发送到给定的地址。
Solidity语言的3种转币方法
* 1.<address>.transfer()
* 2.<address>.send()
* 3.<address>.gas().call.value()
>这三种方法都可以向某一地址发送ether
Solidity语言3种转币方法的区别
* 1.<address>.transfer()
>当发生失败时会throw；回滚状态；
>只会传递2300Gas供调用，防止重入攻击；
* 2.<address>.send()
>当发生失败时会返回false布尔值；
>只会出传递2300Gas供调用，防止重入；
* 3.<address>.gas().call.value()
>当发生失败时会返回false布尔值；
>传递所有可用Gas进行调用（可通过gas(gas_value)进行限制），不能有效防止重入。
## 常用API
* 1. block.blockhash(uint blockNumber) returns (bytes32)：返回给定区块号
的哈希值，只支持最近256个区块，且不包含当前区块。
* 2. block.coinbase(address): 当前块矿工的地址。
* 3. block.difficulty(uint):当前块的难度。
* 4. block.gaslimit(uint):当前块的gaslimit。
* 5. block.number(uint):当前区块的块号。
* 6. block.timestamp(uint): 当前块的Unix时间戳（从1970/1/1 00:00:00 UTC
开始所经过的秒数）
## 调用者相关
* 1. msg.sender(address): 当前调用发起人的地址。
* 2. msg.value(uint): 这个消息所附带的以太币，单位为wei。
* 3. msg.sig(bytes4):调用数据(calldata)的前四个字节（例如为：函数标识符）。
* 4. msg.data(bytes): 完整的调用数据（calldata）。
* 5. tx.origin(address): 交易的发送者
* 6. tx.gasprice(uint) : 交易的 gas 价格。
* 7. now(uint): 当前块的时间戳 (block.timestamp 的别名)















