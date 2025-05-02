import 'package:nftmarketplace/model/profileModel.dart';
import 'package:nftmarketplace/services/web3Services.dart';

class Appconstants {
  Appconstants._();

  static const rpcUrl = "http://10.0.2.2:8545/";
  static const wsUrl = "ws://10.0.2.2:8545/";
  static const privateKey =
      "0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6";
  static const nftContractAddress =
      "0x5fc8d32690cc91d4c39d9d3abcbd16989f875707";
  static const profileContractAddress =
      "0x0165878a594ca255338adfa4d48449f69242eb8f";
  static const subscriptionContractAddress =
      "0x8a791620dd6260079bf849dc5567adc3f2fdc318";
  bool accountExists = false;
  static ProfileModel profilemodel = ProfileModel();
  static List<ProfileModel> allUsers = [];
}
