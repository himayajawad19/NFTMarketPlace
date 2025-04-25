import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/screens/introSlider/introSliderView.dart';

class Splashview extends ConsumerStatefulWidget {
  const Splashview({super.key});
  static const route = '/splash';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashviewState();
}

class _SplashviewState extends ConsumerState<Splashview> {
  bool _title = false;
  

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _title = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 5000), () {
    Navigator.pushReplacementNamed(context, IntroSlider.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.12, 0.34435, 0.65343, 1],
            colors: [
              Color(0xFF30684b),
              Color(0xFF0C2922),
              Color(0xFF0C2922),
              Color(0xFF30684b),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _title ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  "minted",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 50.sp,
                    fontFamily: "Zain",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
