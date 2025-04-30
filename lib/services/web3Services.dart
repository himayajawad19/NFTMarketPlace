import 'dart:convert';
import 'dart:developer';

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
  late DeployedContract _deployedContract;
  late DeployedContract _deployedProfileContract;
  final EthPrivateKey _creds = EthPrivateKey.fromHex(Appconstants.privateKey);
  double _balance = 0.00;
  BigInt profileCount = BigInt.from(0);

  double get balance => _balance;

  ContractFunction? _addProfile;
  ContractFunction? _getProfile;
  ContractFunction? _getProfileCount;
  Future<void> init() async {
    _web3client = Web3Client(
      Appconstants.rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(Appconstants.wsUrl).cast<String>();
      },
    );

    await getAbi();
    await getProfileDeployedContract();

    final EthereumAddress walletAddress = await _creds.extractAddress();
    EtherAmount balance = await _web3client.getBalance(walletAddress);
    _balance = balance.getValueInUnit(EtherUnit.ether);
  }

  Future<void> getAbi() async {
    // final String abiFile = await rootBundle.loadString("assets/json/abi.json");
    // final jsonDecoded = await jsonDecode(abiFile);
    // _abiCode = ContractAbi.fromJson(
    //   jsonEncode(jsonDecoded['abi']),
    //   jsonEncode(jsonDecoded['contractName']),
    // );
    final profileAbi = await rootBundle.loadString(
      'assets/json/profileAbi.json',
    );
    final jsonDecodedprofile = await jsonDecode(profileAbi);
    _profileAbiCode = ContractAbi.fromJson(
      jsonEncode(jsonDecodedprofile['abi']),
      jsonEncode(jsonDecodedprofile['contractName']),
    );
    _contractAddress = EthereumAddress.fromHex(Appconstants.contractAddress);
  }

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
  }

  Future<void> getProfileDeployedContract() async {
    _deployedProfileContract = DeployedContract(
      _profileAbiCode,
      _contractAddress,
    );
    _addProfile = _deployedProfileContract.function('addProfile');
    _getProfile = _deployedProfileContract.function('getProfile');
    _getProfileCount = _deployedProfileContract.function('getNumberOfUsers');
  }

  Future<void> addProfile() async {
    await init();
    final EthereumAddress walletAddress = await _creds.extractAddress();
    final currentNonce = await _web3client.getTransactionCount(walletAddress);
    await _web3client.sendTransaction(
      _creds,
      Transaction.callContract(
        nonce: await currentNonce,
        from: walletAddress,
        contract: _deployedProfileContract,
        function: _addProfile!,
        parameters: [],
      ),
      chainId: 1337,
    );
    EtherAmount balance = await _web3client.getBalance(walletAddress);
    log(balance.toString());
    _balance = balance.getValueInUnit(EtherUnit.ether);
  }

Future<void> getProfileCount() async {
    await init();
    final result = await _web3client.call(
      contract: _deployedProfileContract,
      function: _getProfileCount!,
      params: [],
    );
    profileCount = result[0] as BigInt;
 log('✅ Profile count fetched: $profileCount');
  }
  Future<void> getProfile() async {
    await init();
    await getProfileCount();
     List allProfiles = [];
   for (int i = 1; i <= profileCount.toInt(); i++) {
      List temp = await _web3client.call(
          contract: _deployedProfileContract,
          function: _getProfile!,
          params: []);
      allProfiles.add(temp);
    }
      for (int i = 0; i < allProfiles.length; i++) {
      if (allProfiles[i][0] == EthereumAddress.fromHex(Appconstants.privateKey)) {
       Appconstants.profilemodel = ProfileModel(
        address: allProfiles[i][0],
        following: allProfiles[i][2],
        follower: allProfiles[i][1]
       );

      }
    }
  }
}
