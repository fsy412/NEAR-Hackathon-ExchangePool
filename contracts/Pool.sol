// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import 'hardhat/console.sol';

contract ExchangePool {
    using Counters for Counters.Counter;
    Counters.Counter private swapId;
    using SafeMath for uint256;

    address creator;
    address buyToken;
    address sellToken;
    uint256 raiseAmount;
    uint256 price;
    uint256 state;
    uint256 startTime;
    uint256 endTime;

    struct swapInfo {
        address user;
        uint256 amount;
        uint256 time;
    }

    event LogMsg(string msg);
    event SwapMsg(address user, uint256 amount);

    mapping(address => uint256[]) userToSwapInfo;
    mapping(uint256 => swapInfo) public swapByIndex;
    mapping(address => uint256) public balances;

    constructor(
        address _creator,
        address _buyToken,
        address _sellToken,
        uint256 _raiseAmount,
        uint256 _price,
        uint256 _startTime,
        uint256 _endTime
    ) {
        creator = _creator;
        buyToken = _buyToken;
        sellToken = _sellToken;
        raiseAmount = _raiseAmount;
        price = _price;
        startTime = _startTime;
        endTime = _endTime;
        uint256 bal = IERC20(sellToken).balanceOf(creator);
        require(bal > _raiseAmount.mul(_price).div(10000), 'not enough sell token');
    }

    // sender swap sell
    function swapSell(uint256 amount) external payable {
        require(msg.sender != creator, 'creator swap');
        require(IERC20(buyToken).allowance(msg.sender, address(this)) >= amount, 'Token 2 allowance too low');

        bool sent = IERC20(buyToken).transferFrom(msg.sender, address(this), amount);
        require(sent, 'buyToken transfer failed');

        sent = IERC20(sellToken).transferFrom(creator, address(this), amount.mul(price).div(10000));
        require(sent, 'sellToken transfer failed');

        balances[creator] = balances[creator].add(amount);
        balances[msg.sender] = balances[msg.sender].add(amount.mul(price).div(10000));

        swapInfo memory Info = swapInfo(msg.sender, amount, block.timestamp);
        swapId.increment();
        swapByIndex[swapId.current()] = Info;

        emit SwapMsg(msg.sender, amount);
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function withdraw() public {
        require(block.timestamp > endTime, 'pool not ended withdraw not allowed');
        if (msg.sender == creator) {
            IERC20(buyToken).transfer(msg.sender, balances[msg.sender]);
        } else {
            IERC20(sellToken).transfer(msg.sender, balances[msg.sender]);
        }
    }

    function getSwapInfo() external view returns (swapInfo[] memory, bool) {
        uint256 startIndex = 1;
        uint256 len = swapId.current();
        swapInfo[] memory Info = new swapInfo[](len);

        uint256 j = 0;
        for (uint256 i = startIndex; i <= len; i++) {
            Info[j] = swapByIndex[i];
            j++;
        }

        return (Info, true);
    }
}
