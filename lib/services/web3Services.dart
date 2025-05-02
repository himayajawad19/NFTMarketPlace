import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:nftmarketplace/model/profileModel.dart';
import 'package:nftmarketplace/utils/appConstants.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

class Web3services {
  static final Web3services _web3services = Web3services._internal();
  factory Web3services() => _web3services;
  Web3services._internal();

  // initialization
  late Web3Client _web3client;
  late ContractAbi _abiCode;
  late ContractAbi _profileAbiCode;
  late EthereumAddress _contractAddress;
  late EthereumAddress _profileContractAddress;
  late DeployedContract _deployedContract;
  late DeployedContract _deployedProfileContract;
  final EthPrivateKey _creds = EthPrivateKey.fromHex(Appconstants.privateKey);
  double _balance = 0.00;
  BigInt profileCount = BigInt.from(0);

  double get balance => _balance;

  ContractFunction? _addProfile;
  ContractFunction? _getProfile;
  ContractFunction? _getProfileCount;
  ContractFunction? _followUser;
  ContractFunction? _getAllProfile;
  Future<void> init() async {
    log("Initialzing Web3 Client...........");
    _web3client = Web3Client(
      Appconstants.rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(Appconstants.wsUrl).cast<String>();
      },
    );
    log("Initialized...........");
    await getAbi();
    await getProfileDeployedContract();

    final EthereumAddress walletAddress = await _creds.extractAddress();
    EtherAmount balance = await _web3client.getBalance(walletAddress);
    _balance = balance.getValueInUnit(EtherUnit.ether);
    log(balance.toString());
  }

  Future<void> getAbi() async {
    final String abiFile = await rootBundle.loadString("assets/json/abi.json");
    final jsonDecoded = await jsonDecode(abiFile);
    _abiCode = ContractAbi.fromJson(
      jsonEncode(jsonDecoded['abi']),
      jsonEncode(jsonDecoded['contractName']),
    );
    final profileAbi = await rootBundle.loadString(
      'assets/json/profileAbi.json',
    );
    final jsonDecodedprofile = await jsonDecode(profileAbi);
    _profileAbiCode = ContractAbi.fromJson(
      jsonEncode(jsonDecodedprofile['abi']),
      jsonEncode(jsonDecodedprofile['contractName']),
    );
    _profileContractAddress = EthereumAddress.fromHex(
      Appconstants.profileContractAddress,
    );
  }

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
  }

  Future<void> getProfileDeployedContract() async {
    _deployedProfileContract = DeployedContract(
      _profileAbiCode,
      _profileContractAddress,
    );
    _addProfile = _deployedProfileContract.function('addProfile');
    _getProfile = _deployedProfileContract.function('getProfile');
    _getProfileCount = _deployedProfileContract.function('getNumberOfUsers');
    _followUser = _deployedProfileContract.function('followProfile');
    _getAllProfile = _deployedProfileContract.function("getAllUsers");
  }

  Future<void> addProfile() async {
    final EthereumAddress walletAddress = await _creds.extractAddress();
    log("Adding Profile...........");
    await _web3client.sendTransaction(
      _creds,
      Transaction.callContract(
        from: walletAddress,
        contract: _deployedProfileContract,
        function: _addProfile!,
        parameters: ["Olivia", "Flutter Dev"],
      ),
      chainId: 1337,
    );
    log("Profile Added.............");
    await getProfile();
    EtherAmount balance = await _web3client.getBalance(walletAddress);
    log(balance.toString());
    _balance = balance.getValueInUnit(EtherUnit.ether);
  }

  Future<void> getProfileCount() async {
    final result = await _web3client.call(
      contract: _deployedProfileContract,
      function: _getProfileCount!,
      params: [],
    );
    profileCount = result[0] as BigInt;
    log('✅ Profile count fetched: $profileCount');
  }

  Future<void> getProfile() async {
    await getProfileCount();
    log("Getting Profile..........");
    final EthereumAddress walletAddress = await _creds.extractAddress();

    final result = await _web3client.call(
      contract: _deployedProfileContract,
      function: _getProfile!,
      params: [],
      sender: walletAddress,
    );
    log(result[0].toString());

    List<String> Followers = List<String>.from(result[0][3]);
    List<String> Following = List<String>.from(result[0][4]);

    Appconstants.profilemodel = ProfileModel(
      address: result[0][0].toString(),
      name: result[0][1],
      desc: result[0][2],
      follower: Followers,
      following: Following,
      publicKey: walletAddress.toString(),
    );
    log("✅ Profile fetched for ${result[0]}");
  }

  Future<void> getAllProfiles() async {
    await getProfileCount();
    log("Getting Profile..........");

    final result = await _web3client.call(
      contract: _deployedProfileContract,
      function: _getAllProfile!,
      params: [],
    );

    log("Raw result: ${result.toString()}");
    Appconstants.allUsers.clear();

    if (result.isNotEmpty && result[0] is List) {
      List<dynamic> allProfiles = result[0];
      log("Number of profiles: ${allProfiles.length}");

      for (int i = 0; i < allProfiles.length; i++) {
        var profile = allProfiles[i];
        if (profile is List && profile.length >= 5) {
          List<String> Followers =
              (profile[3] as List).map((addr) => addr.toString()).toList();
          List<String> Following =
              (profile[4] as List).map((addr) => addr.toString()).toList();

          ProfileModel profilemodel = ProfileModel(
            address: profile[0].toString(),
            desc: profile[2],
            name: profile[1],
            follower: Followers,
            following: Following,
          );

          Appconstants.allUsers.add(profilemodel);
        }
      }
    }

    log("Added ${Appconstants.allUsers.length} profiles to the list");
  }

  Future<bool> followProfile(String profileAddress) async {
    try {
      final EthereumAddress ethAddress = EthereumAddress.fromHex(
        profileAddress,
      );

      final EthereumAddress walletAddress = await _creds.extractAddress();

      final result = await _web3client.call(
        contract: _deployedProfileContract,
        function: _followUser!,
        params: [ethAddress],
        sender: walletAddress,
      );
log("------------- started following");
      return true;
    } catch (e) {
      print('Error following profile: $e');
      return false;
    }
  }
}
