// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFTMarketPlace is ERC721URIStorage {
    constructor() ERC721("NFT Magazine Subscription", "MEG") {}
    struct nftsStruct {
        string title;
        string description;
        uint256 tokenId;
        uint256 likes;
        uint price;
        address[] subscribers;
        address payable owner;
        address payable seller;
    }

    event nftsStructEvent(
        string title,
        string description,
        uint256 indexed tokenId,
        uint256 likes,
        uint price,
        address[] subscribers,
        address payable owner,
        address payable seller
    );
    mapping(uint256 => nftsStruct) private nfts;
    uint256 private _tokenId;
    uint256 private _nftsAvailableforsale;

    function setNft(
        uint256 _setTokenId,
        string memory _title,
        string memory _description
    ) private {
        nfts[_setTokenId].tokenId = _setTokenId;
        nfts[_setTokenId].seller = payable(msg.sender);
        nfts[_setTokenId].owner = payable(msg.sender);
        nfts[_setTokenId].likes = 1;
        nfts[_setTokenId].price = 0;
        nfts[_setTokenId].title = _title;
        nfts[_setTokenId].description = _description;
        nfts[_setTokenId].subscribers = [msg.sender];
        emit nftsStructEvent(
            _title,
            _description,
            _setTokenId,
            nfts[_setTokenId].likes,
            0,
            nfts[_setTokenId].subscribers,
            payable(msg.sender),
            payable(msg.sender)
        );
    }

    // creating nft
    function createNft(
        string memory _tokenUrI,
        string memory _title,
        string memory _description
    ) public returns (uint256) {
        _tokenId++;
        uint256 _newTokenId = _tokenId;
        _mint(msg.sender, _newTokenId);
        _setTokenURI(_newTokenId, _tokenUrI);
        setNft(_newTokenId, _title, _description);
        return _newTokenId;
    }

    // setting up the nft for listimg.
    function sellNft(
        uint256 _sellTokenId,
        uint256 _price
    ) public returns (uint256) {
        require(
            _isAuthorized(nfts[_sellTokenId].owner, msg.sender, _sellTokenId),
            "Only NFT owner can perform this"
        );
        _transfer(msg.sender, address(this), _sellTokenId);
        nfts[_sellTokenId].price = _price;
        nfts[_sellTokenId].owner = payable(address(this));
        _nftsAvailableforsale++;
        return _nftsAvailableforsale;
    }

    function buyNft(uint256 _buyTokenId) public payable returns (bool) {
        require(nfts[_buyTokenId].owner == address(this), "NFT Unavailable");
        require(
            msg.value >= nfts[_buyTokenId].price,
            "Insufficient funds to buy NFT"
        );
        payable(nfts[_tokenId].seller).transfer(msg.value);
        nfts[_tokenId].subscribers.push(msg.sender);
        _nftsAvailableforsale--;

        return true;
    }

    // fetch available nfts for sale, that will be displayed on the market place.
    function getSubscriptions() public view returns (nftsStruct[] memory) {
        uint256 nftCount = _tokenId;
        nftsStruct[] memory subscriptions = new nftsStruct[](nftCount);

        for (uint256 i; i < nftCount; i++) {
            if (nfts[i].owner == address(this)) {
                subscriptions[i] = nfts[i];
            }
        }
        return subscriptions;
    }
    //Nfts a user had already subcribed to
    function getCollectables() public view returns (nftsStruct[] memory) {
        uint256 nftCount = _tokenId;
        nftsStruct[] memory subscriptions = new nftsStruct[](nftCount);

        for (uint256 i; i < nftCount; i++) {
            uint256 subscribers = nfts[i].subscribers.length;
            for (uint256 j; j < subscribers; j++) {
                if (nfts[i].subscribers[j] == msg.sender) {
                    subscriptions[i] = nfts[i];
                }
            }
        }
        return subscriptions;
    }

    //NFTs a user has created
    function getNFTS() public view returns (nftsStruct[] memory) {
        uint256 nftCount = _tokenId;
        nftsStruct[] memory nftsCreated = new nftsStruct[](nftCount);
        for (uint256 i; i < nftCount; i++) {
            if (nfts[i].seller == payable(msg.sender)) {
                nftsCreated[i] = nfts[i];
            }
        }
        return nftsCreated;
    }

    //Details of a single NFTs
    function getIndividualNft(
        uint256 _individualNftTokenId
    ) public view returns (nftsStruct memory) {
        return nfts[_individualNftTokenId];
    }

    function likeSubscription(uint256 _likeTokenId) public {
        nfts[_likeTokenId].likes += 1;
    }

    function unlikeSubscription(uint256 _likeTokenId) public {
        nfts[_likeTokenId].likes -= 1;
    }
}
