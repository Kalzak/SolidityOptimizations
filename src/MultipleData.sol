// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MultipleDataBad {
    mapping(address => uint256) public favnum;
    mapping(address => uint256) public leastfavnum;

    function interact(address[] memory _users, uint256[] memory _favnum, uint256[] memory _leastfavnum) public {
        require(_users.length == _favnum.length);
        require(_users.length == _leastfavnum.length);

        uint256 i = 0;
        for(i; i < _users.length; i++) {
            favnum[_users[i]] = _favnum[i];
            leastfavnum[_users[i]] = _leastfavnum[i];
        }
    }   
}

contract MultipleDataGood {
    mapping(address => uint256) public favnum;
    mapping(address => uint256) public leastfavnum;

    struct MultipleDataInput {
        address user;
        uint256 favnum;
        uint256 leastfavnum;
    }

    function interact(MultipleDataInput[] memory data) public {

        uint256 i = 0;
        for(i; i < data.length; i++) {
            favnum[data[i].user] = data[i].favnum;
            leastfavnum[data[i].user] = data[i].leastfavnum;
        }
    }   
}
