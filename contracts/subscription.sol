// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract SubscriptionModel {
    // struct
    mapping(uint256 => uint64) internal _expirations;
    // Events
    event SubscriptionUpdate(uint256 indexed tokenId, uint64 expiration);
    function cancelSubscription(uint256 _tokenId) external payable {
        delete _expirations[_tokenId];
        emit SubscriptionUpdate(_tokenId, 0);
    }

    function expiresAt(uint256 _tokenId) external view returns (uint64) {
        return _expirations[_tokenId];
    }
    function isRenewable(uint256 tokenId) public pure returns (bool) {
        return true;
    }
    function renewSubscription(
        uint256 _tokenId,
        uint64 duration
    ) external payable {
        uint64 currentExpiration = _expirations[_tokenId];
        uint64 newExpiration;
        if (currentExpiration == 0) {
            //block.timestamp -> Current block timestamp as seconds since unix epoch
            newExpiration = uint64(block.timestamp) + duration;
        } else {
            require(isRenewable(_tokenId), "Subscription Not Renewable");
            newExpiration = currentExpiration + duration;
        }
        _expirations[_tokenId] = newExpiration;
        emit SubscriptionUpdate(_tokenId, newExpiration);
    }
}
