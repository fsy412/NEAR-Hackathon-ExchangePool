pragma solidity ^0.8.0;
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Token is ERC20 {
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply * 10**18);
    }
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
    function faucet() public payable {
        _mint(msg.sender, 100 * (1 ether));
    }
}