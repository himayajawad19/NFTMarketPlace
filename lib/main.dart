import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/screens/splashscreen/splashView.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    ScreenUtilInit(
      builder:  (_ , child) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      );}
    );
  }
}

