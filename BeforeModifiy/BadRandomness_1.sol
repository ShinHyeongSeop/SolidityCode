pragma solidity ^0.6.6;

contract randomFeatBlock{
	uint blockNumber = block.number;
	function play() public payable {
		require(msg.value >= 1 ether);
		if (uint(blockhash(blockNumber)) % 2 == 0) {
			msg.sender.transfer(address(this).balance);
		}
	}	
}
