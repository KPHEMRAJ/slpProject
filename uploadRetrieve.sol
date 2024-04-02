// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    // Mapping to store data associated with each user and timestamp
    mapping(string => mapping(uint256 => string[2])) private userData;

    // Function to upload data
    function uploadData(string memory appName, uint256 timestamp, string memory username, string memory data) public {
        // Store the data associated with the provided user and timestamp
        userData[username][timestamp] = [appName, data];
    }

    // Function to return data
    function returnData(string memory appName, uint256 timestamp, string memory username) public view returns (string memory) {
        // Check if data is mapped to the provided user and timestamp
        string[2] memory storedData = userData[username][timestamp];
        if (keccak256(abi.encodePacked(storedData[0])) != keccak256(abi.encodePacked(appName))) {
            return "Not authorized error";
        } else {
            // Return the data associated with the provided user and timestamp
            return storedData[1];
        }
    }
}
