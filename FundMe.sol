// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    // allow users to send $
    // have a minimum $ to sent

    uint256 public minimumUSD = 5e18;

    function fund() public payable {
        require(getConversionRate(msg.value) >= minimumUSD, "insufficiant ether amount"); // 1e18 = 1 ETH = 1000000000000000000 wei = 1 * 1 ** 18; (1 puissance 18)
    }

    function withdraw() public{}

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getETHPrice();

        uint256 usdETH = (ethPrice * ethAmount) / 1e18;

        return usdETH;
    }

    function getETHPrice() public view returns (uint256) {
        // Address of the Chainlink contract to get ETH Price => 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // get ABI => AggregatorV3Interface

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        
        return uint256(price *1e10);
    }
}