// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PostStorage {
    struct Post {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    uint256 public postCount;
    mapping(uint256 => Post) public posts;
    mapping(uint256 => mapping(address => bool)) public liked;

    event PostCreated(uint256 id, address author, string content, uint256 timestamp);
    event PostLiked(uint256 id, address user);

    function createPost(string memory _content) public {
        postCount++;
        posts[postCount] = Post(postCount, msg.sender, _content, block.timestamp, 0);
        emit PostCreated(postCount, msg.sender, _content, block.timestamp);
    }

    function likePost(uint256 _id) public {
        require(!liked[_id][msg.sender], "Already liked");
        posts[_id].likes++;
        liked[_id][msg.sender] = true;
        emit PostLiked(_id, msg.sender);
    }
}
