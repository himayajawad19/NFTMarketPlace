import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nftmarketplace/screens/home/home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState());

  List<String> topCollection =[
    "assets/images/1.jpg",
     "assets/images/2.jpg",
      "assets/images/3.jpg",
       "assets/images/4.jpg",
       "assets/images/5.jpg",
       "assets/images/6.jpg",
  ];
}

final homeProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
);