// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title User Registry for DecentraPost
contract UserRegistry {
    mapping(address => string) public usernames;

    event UserRegistered(address indexed user, string username);

    function register(string memory _username) public {
        require(bytes(usernames[msg.sender]).length == 0, "Already registered");
        usernames[msg.sender] = _username;
        emit UserRegistered(msg.sender, _username);
    }

    function getUsername(address _user) public view returns (string memory) {
        return usernames[_user];
    }
}
