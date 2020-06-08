pragma solidity ^0.6.8;

contract Bank {
  mapping(address => uint) private balances; // 주소별로 금액을 관리
  uint a;
  // deposit to msg.sender's balances
  function deposit() external payable {
    balances[msg.sender] += msg.value;
  }
  
  // withdraw amount from msg.sender's balances
  function withdraw(uint _amount) external{
    if(balances[msg.sender] >= _amount) {
        (bool chk,) = msg.sender.call{value : _amount}("");
        balances[msg.sender] -= _amount; 
        
    }
  }
  // total balance of Bank
  function totalBalance() public view returns (uint){
      return address(this).balance;
  }
  fallback() external payable {}
  receive() external payable {
  }
}