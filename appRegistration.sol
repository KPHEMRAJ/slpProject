// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccountRegistry {
    mapping(address => string) private addressToName;
    mapping(string => address) private nameToAddress;

    modifier uniqueName(string memory _name) {
        require(nameToAddress[_name] == address(0), "Name already exists");
        _;
    }

    function setAccount(string memory _name, address _address) public uniqueName(_name) {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(_address != address(0), "Invalid address");

        addressToName[_address] = _name;
        nameToAddress[_name] = _address;
    }

    function getName(address _address) public view returns (string memory) {
        return addressToName[_address];
    }

    function getAddress(string memory _name) public view returns (address) {
        return nameToAddress[_name];
    }
}
