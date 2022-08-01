//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    address public owner;

    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    function changeTokens() public {
        tokens[0] = "VET";
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}

    fallback() external payable {}

    function transferAll(address payable to)
        public
        onlyOwner
        returns (bool, bytes memory)
    {
        (bool success, bytes memory returnBytes) = to.call{
            value: address(this).balance
        }("");
        return (success, returnBytes);
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory first, string memory second)
        public
        pure
        returns (string memory)
    {
        return string.concat(first, second);
    }
}
