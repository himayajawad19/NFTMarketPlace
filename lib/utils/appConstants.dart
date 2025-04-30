import 'package:nftmarketplace/model/profileModel.dart';
import 'package:nftmarketplace/services/web3Services.dart';

class Appconstants {
  Appconstants._();

  static const rpcUrl = "http://10.0.2.2:8545/";
  static const wsUrl = "ws://10.0.2.2:8545/";
  static const privateKey =
      "0xea6c44ac03bff858b476bba40716402b03e41b8e97e276d1baec7c37d42484a0";
  static const contractAddress = "0x8a791620dd6260079bf849dc5567adc3f2fdc318";
 bool accountExists = false;
 static ProfileModel profilemodel = ProfileModel();
}
