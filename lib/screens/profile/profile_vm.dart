import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nftmarketplace/screens/profile/profile_state.dart';

class ProfileVm extends StateNotifier<ProfileState> {
  ProfileVm() : super(ProfileState());

  List topCollection =[
    "assets/images/1.jpg",
     "assets/images/2.jpg",
      "assets/images/3.jpg",
       "assets/images/4.jpg",
       "assets/images/5.jpg",
       "assets/images/6.jpg",
  ];
}

final profileProvider = StateNotifierProvider<ProfileVm, ProfileState>(
  (ref) => ProfileVm(),
);
