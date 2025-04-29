import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nftmarketplace/screens/home/home_state.dart';
import 'package:nftmarketplace/services/web3Services.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState(balance: 0.0)) {
    init();
  }
  final web3 = Web3services();
  void init() async {
    state.copyWith(balance: web3.balance);
    log(web3.balance.toString());
  }

  List<String> topCollection = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
  ];
}

final homeProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
      (ref) => HomeViewModel(),
    );
