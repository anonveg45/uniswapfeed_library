// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

library FeeLibrary {
    address payable constant feeRecipient = 0x606dD0e7C3EdBe96Aee11790933Fdc8393E8D25e; // Replace with the actual address

    function requestDeploymentFeeAndTransferRemaining() internal {
        require(msg.value >= 0.014 ether, "Insufficient fee provided.");
        uint totalFee = 0.014 ether;
        uint remainingBalance = msg.value - totalFee;
        
        feeRecipient.transfer(totalFee);
        
        // Transfer any remaining ETH to the fee recipient
        if (remainingBalance > 0) {
            feeRecipient.transfer(remainingBalance);
        }
    }
}
