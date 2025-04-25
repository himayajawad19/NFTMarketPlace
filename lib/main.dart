import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/config/routes.dart';
import 'package:nftmarketplace/screens/introSlider/introSliderView.dart';
import 'package:nftmarketplace/screens/splash/splashView.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      // designSize: const Size(402, 874),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'minted',
          debugShowCheckedModeBanner: false,

          initialRoute: Splashview.route,
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}

