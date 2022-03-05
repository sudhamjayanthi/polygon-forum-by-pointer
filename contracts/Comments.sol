// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Comments {
    // Exposed data structure
    struct Comment {
        uint32 id;
        string topic;
        address creator_address;
        string message;
        uint256 created_at;
    }

    // Notify users that a comment was added
    event CommentAdded(Comment comment);

    mapping(string => Comment[]) commentsByTopic;
    uint32 private idCounter;

    // Fetch a list of comments for a topic
    function getComments(string calldata topic) public view returns (Comment[] memory) {
        return commentsByTopic[topic];
    }

    // Persist a new comment
    function addComment(string calldata topic, string calldata message) public {
        Comment memory comment = Comment({
            id: idCounter,
            topic: topic,
            creator_address: msg.sender,
            message: message,
            created_at: block.timestamp
        });
        commentsByTopic[topic].push(comment);

        // increment the id counter
        idCounter++;

        emit CommentAdded(comment);
    }
}
