// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Profile {
    struct profileModel {
        address id;
        string name;
        string description;
        address[] followers;
        address[] following;
    }

    uint256 profileCount;
    address[] private profileAddresses;

    mapping(address => profileModel) public profiles;
    event ProfileCreated(address indexed user, string name, string desc);
    event Followed(address indexed follower, address indexed followed);
    event Unfollowed(address indexed follower, address indexed unfollowed);

    function getNumberOfUsers() public view returns (uint256) {
        uint256 noOfUsers = profileCount;
        return noOfUsers;
    }
    // add profile
    function addProfile(string memory name, string memory desc) public {
        require(
            profiles[msg.sender].id == address(0),
            "User profile already exists."
        );

        profiles[msg.sender].id = msg.sender;
        profiles[msg.sender].name = name;
        profiles[msg.sender].description = desc;
        profileAddresses.push(msg.sender);
        profileCount++;
        emit ProfileCreated(
            msg.sender,
            profiles[msg.sender].name,
            profiles[msg.sender].description
        );
    }

    // add follower/following
    function followProfile(address _account) public {
        require(_account != address(0), "Profile does not exist.");
        profiles[msg.sender].following.push(_account);
        profiles[_account].followers.push(msg.sender);
        emit Followed(msg.sender, _account);
    }

    function unfollowProfile(address _account) public {
        require(_account != address(0), "Profile does not exist.");

        _removeAddress(profiles[msg.sender].following, _account);
        _removeAddress(profiles[_account].followers, msg.sender);
        emit Unfollowed(msg.sender, _account);
    }

    // get profile
    function getProfile() public view returns (profileModel memory) {
        require(
            profiles[msg.sender].id != address(0),
            "Profile does not exist."
        );
        return profiles[msg.sender];
    }

    function _removeAddress(address[] storage arr, address target) internal {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == target) {
                arr[i] = arr[arr.length - 1];
                arr.pop();
                break;
            }
        }
    }

    function getAllUsers() public view returns (profileModel[] memory) {
        profileModel[] memory allProfiles = new profileModel[](
            profileAddresses.length
        );

        for (uint i = 0; i < profileAddresses.length; i++) {
            allProfiles[i] = profiles[profileAddresses[i]];
        }

        return allProfiles;
    }
    function recoverExistingProfiles(address[] memory knownAddresses) public {
        for (uint i = 0; i < knownAddresses.length; i++) {
            address user = knownAddresses[i];
            if (profiles[user].id != address(0)) {
                profileAddresses.push(user);
            }
        }
    }
}
