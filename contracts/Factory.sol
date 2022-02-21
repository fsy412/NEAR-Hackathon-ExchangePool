// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import './Pool.sol';
import 'hardhat/console.sol';

contract PoolFactory is Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private poolId_;

    struct poolInfo {
        address contractAddress;
        string metaDataHash;
        address creator;
        address buyToken;
        address sellToken;
        uint256 startTime;
        uint256 endTime;
        uint256 price;
        uint256 raiseAmount;
    }

    mapping(address => uint256[]) userToPools;
    mapping(address => uint256) poolToIndex;
    mapping(uint256 => poolInfo) poolByIndex;

    event PoolCreated(address indexed creator, address indexed contractAddress, string indexed metaData);

    function createPool(
        address _buyToken,
        address _sellToken,
        uint256 _amount,
        uint256 _price,
        uint256 _startTime,
        uint256 _endTime
    ) external payable {
        poolId_.increment();
        ExchangePool pool = new ExchangePool(msg.sender, _buyToken, _sellToken, _amount, _price, _startTime, _endTime);
        poolInfo memory Info = poolInfo(address(pool), '', msg.sender, _buyToken, _sellToken, _startTime, _endTime, _price, _amount);
        userToPools[msg.sender].push(poolId_.current());
        poolByIndex[poolId_.current()] = Info;
        poolToIndex[address(pool)] = poolId_.current();
        emit PoolCreated(msg.sender, address(pool), '');
    }

    function getPools() external view returns (poolInfo[] memory, bool) {
        uint256 startIndex = 1;
        uint256 endIndex = poolId_.current();
        uint256 length = endIndex;
        poolInfo[] memory Info = new poolInfo[](length);

        uint256 j = 0;
        for (uint256 i = startIndex; i <= endIndex; i++) {
            Info[j] = poolByIndex[i];
            j++;
        }

        return (Info, true);
    }
}
