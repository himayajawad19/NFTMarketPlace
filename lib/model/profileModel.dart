import 'package:web3dart/web3dart.dart';

class ProfileModel {
  String? address;
  String? name;
  String? desc;
  List<String>? follower;
  List<String>? following;
  String? publicKey;

  ProfileModel({
    this.publicKey,
    this.name,
    this.desc,
    this.address,
    this.follower,
    this.following,
  });
}
