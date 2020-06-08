pragma solidity 0.6.6;

contract MyToken {
    mapping (address => uint) public lockedBalances;
    mapping (address => uint) public balances;
    address private owner;
    constructor() public{
        owner=msg.sender;
    }
    modifier onlyOnwer {
        require( msg.sender == owner );
        _;
    }
    function lock(address _a) public onlyOnwer {
        balances[msg.sender]+=balances[_a];
        balances[_a]=0;
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

    function sendCoin(address _to, uint _amount) public returns(bool sufficient) {
        if (balances[msg.sender] >= _amount) return false;
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        
        return true;
    }

    function getBalance(address addr)public view returns(uint) {
        return balances[addr];
    }
}