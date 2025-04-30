import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nftmarketplace/model/profileModel.dart';
import 'package:nftmarketplace/screens/profile/profile_state.dart';
import 'package:nftmarketplace/services/web3Services.dart';
import 'package:nftmarketplace/utils/appConstants.dart';

class ProfileVm extends StateNotifier<ProfileState> {
  ProfileVm() : super(ProfileState()){
    init();
  }

 final web3 = Web3services();
  void init() async {
    await web3.init();
    await web3.getProfile();
    state = state.copyWith(Followers: Appconstants.profilemodel.follower?.length.toString() , Following: Appconstants.profilemodel.following?.length.toString() );
  }


}

final profileProvider = StateNotifierProvider<ProfileVm, ProfileState>(
  (ref) => ProfileVm(),
);
