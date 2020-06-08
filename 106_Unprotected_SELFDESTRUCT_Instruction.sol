pragma solidity 0.6.6;

contract MyToken {
    mapping (address => uint) public balances;
    address private owner;
    constructor() private{
        owner=msg.sender;
    }
    modifier onlyOnwer {
        require( msg.sender == owner );
        _;
    }
    function newOwner(address _addr) external /*onlyOnwer*/{
        require(_addr != 0);
        owner = _addr;
    }
 
    function deposit() public payable {
        balances[msg.sender]+=msg.value;
    }

    function withdraw(uint _amount) public {
        if(balances[msg.sender] >= _amount){
            balances[msg.sender] -= _amount;
            msg.sender.transfer(_amount);
        }
    }

    function run() public onlyOnwer{
        selfdestruct(msg.sender);
    }

    function getBalance(address _addr)public view returns(uint) {
        return balances[_addr];
    }
}