import 'dart:convert';
import 'dart:developer';


import 'package:flutter/services.dart';
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

  double get balance => _balance;

  ContractFunction? _addProfile;
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
  }

  Future<void> getAbi() async {
    // final String abiFile = await rootBundle.loadString("assets/json/abi.json");
    // final jsonDecoded = await jsonDecode(abiFile);
    // _abiCode = ContractAbi.fromJson(
    //   jsonEncode(jsonDecoded['abi']),
    //   jsonEncode(jsonDecoded['contractName']),
    // );
    final profileAbi = await rootBundle.loadString('assets/json/profileAbi.json');
     final jsonDecodedprofile = await jsonDecode(profileAbi);
    _profileAbiCode = ContractAbi.fromJson(
      jsonEncode(jsonDecodedprofile['abi']),
      jsonEncode(jsonDecodedprofile['contractName']),);
    _contractAddress = EthereumAddress.fromHex(Appconstants.contractAddress);
  }

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
 
  }
    Future<void> getProfileDeployedContract() async {
    _deployedProfileContract = DeployedContract(_profileAbiCode, _contractAddress);
    _addProfile = _deployedProfileContract.function('addProfile');
  }

  Future<void> addProfile() async {
    await init();
    final EthereumAddress walletAddress = await _creds.extractAddress();
    final currentNonce = await _web3client!.getTransactionCount(walletAddress);
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
    EtherAmount balance = await _web3client.getBalance(
     walletAddress,
    );
    log(balance.toString());
    _balance = balance.getValueInUnit(EtherUnit.gwei);
  }
}
