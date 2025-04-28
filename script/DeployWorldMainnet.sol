// SPDX-License-Identifier: MIT
pragma solidity >=0.8.28;

import "forge-std/src/Script.sol";
import "../src/ChainlinkPriceFeed.sol";

contract DeployProduction is Script {
    function run() external {
        address verifierProxyAddress = [0x......................];
        address usdcAddress = [0x......................];
        address pairAddress;
        bytes32 feedId;
        string memory pairName;

        // Deploy FOO/BAR
        pairAddress = [0x......................];
        feedId = [0x......................];
        pairName = "FOO/BAR";
        deployPriceFeed(pairAddress, usdcAddress, payable(verifierProxyAddress), feedId, pairName, 18);

        // Deploy FOO2/BAR2
        pairAddress = [0x......................];
        feedId = [0x......................];
        pairName = "FOO2/BAR2";
        deployPriceFeed(pairAddress, usdcAddress, payable(verifierProxyAddress), feedId, pairName, 18);

       // Deploy FOOx/BARx
        pairAddress = [0x......................];
        feedId = [0x......................];
        pairName = "FOOx/BARx";
        deployPriceFeed(pairAddress, usdcAddress, payable(verifierProxyAddress), feedId, pairName, 18);
    }

    function deployPriceFeed(
        address pairAddress,
        address usdcAddress,
        address verifierProxyAddress,
        bytes32 feedId,
        string memory pairName,
        uint8 decimals
    )
        internal
    {
        vm.startBroadcast();
        new ChainlinkPriceFeed(pairAddress, usdcAddress, payable(verifierProxyAddress), feedId, pairName, decimals);
        vm.stopBroadcast();
    }
}
