pragma solidity ^0.6.6;

contract Auction {
    address payable currentLeader;
    uint highestBid;
    function high() public view returns(uint256){
        return highestBid;
    }
    function bid() public payable {
        require(msg.value > highestBid);

        require(currentLeader.send(highestBid)); // Refund the old leader, if it fails then revert

        currentLeader = msg.sender;
        highestBid = msg.value;
    }
}