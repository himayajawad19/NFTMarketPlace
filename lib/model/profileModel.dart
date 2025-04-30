import 'package:web3dart/web3dart.dart';

class ProfileModel {
  EthereumAddress? address;
  List<EthereumAddress>? follower;
  List<EthereumAddress>? following;

  ProfileModel({this.address, this.follower, this.following});
}