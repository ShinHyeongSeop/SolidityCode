pragma solidity ^0.6.6;

contract arithmetic2{
    uint public zero = 0;
    uint public max = 2**256-1;
    
    function overflow() public {
        zero += 1;
    }
	
}
