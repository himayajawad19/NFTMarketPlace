import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nftmarketplace/screens/home/home_view.dart';
import 'package:nftmarketplace/services/web3Services.dart';
import 'package:nftmarketplace/utils/appConstants.dart';

class IntroSlider extends ConsumerStatefulWidget {
  const IntroSlider({super.key});
  static const route = '/introSlider';

  @override
  ConsumerState<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends ConsumerState<IntroSlider> {
  bool _animateCircles = false;
  bool _showText = false;

  final _web3 = Web3services();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _showText = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _animateCircles = true;
      });
      setState(() {
        _showText = true;
      });
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
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,

                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 150.w,
                      bottom: 560.h,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 800),
                        opacity: _animateCircles ? 1.0 : 0.0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.easeInCirc,
                          height: _animateCircles ? 330.h : 300.h,
                          width: _animateCircles ? 250.h : 200.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(115, 117, 117, 117),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 180.w,
                      bottom: 530.h,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 800),
                        opacity: _animateCircles ? 1.0 : 0.0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.easeInCirc,
                          height: _animateCircles ? 330.h : 300.h,
                          width: _animateCircles ? 250.h : 200.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(115, 117, 117, 117),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 280.w,
                      bottom: 600.h,
                      child: AnimatedScale(
                        scale: _animateCircles ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 2000),
                        child: SvgPicture.asset(
                          'assets/sparkle.svg',
                          height: 50.h,
                          color: Color(0xFFaeff8d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 230.w,
                      bottom: 550.h,
                      child: AnimatedScale(
                        scale: _animateCircles ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 2000),
                        child: SvgPicture.asset(
                          'assets/sparkle.svg',
                          height: 30.h,
                          color: Color(0xFFaeff8d),
                        ),
                      ),
                    ),

                    centerText(),
                    Positioned(
                      left: 150.w,
                      top: 560.h,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 800),
                        opacity: _animateCircles ? 1.0 : 0.0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.easeInCirc,
                          height: _animateCircles ? 330.h : 300.h,
                          width: _animateCircles ? 250.h : 200.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(115, 117, 117, 117),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 180.w,
                      top: 530.h,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 800),
                        opacity: _animateCircles ? 1.0 : 0.0,
                        child: AnimatedContainer(
                          curve: Curves.easeInCirc,
                          duration: Duration(milliseconds: 2000),
                          height: _animateCircles ? 330.h : 300.h,
                          width: _animateCircles ? 250.h : 200.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(115, 117, 117, 117),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 290.w,
                      top: 585.h,
                      child: AnimatedScale(
                        scale: _animateCircles ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 2000),
                        child: SvgPicture.asset(
                          'assets/sparkle.svg',
                          height: 30.h,
                          color: Color(0xFFaeff8d),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10.w,
                      right: 10.w,
                      bottom: 20.h,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 1000),
                        offset: _showText ? Offset(0, 0) : Offset(0, 0.3),
                        child: centerButton(_web3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget centerText() {
    return AnimatedSlide(
      duration: Duration(milliseconds: 1000),
      offset: _showText ? Offset(0, 0) : Offset(0, 0.3), // slides up
      curve: Curves.linearToEaseOut,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 800),
        opacity: _showText ? 1.0 : 0.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover,",
                style: TextStyle(fontSize: 40.sp, color: Colors.white),
              ),
              Text(
                "Collection,",
                style: TextStyle(fontSize: 40.sp, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    "and",
                    style: TextStyle(fontSize: 40.sp, color: Colors.white),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Sell",
                    style: TextStyle(fontSize: 40.sp, color: Color(0xFFaeff8d)),
                  ),
                ],
              ),
              Text(
                "Awesome",
                style: TextStyle(fontSize: 40.sp, color: Colors.white),
              ),
              Text(
                "Abstract NFTs",
                style: TextStyle(fontSize: 40.sp, color: Colors.white),
              ),
              SizedBox(height: 20.h),
              Text(
                "is the world's first and largest NFT \nmarketplace",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget centerButton(Web3services _web3) {
    return GestureDetector(
      onTap: () async{
        await _web3.init();
        await _web3.addProfile();
        await Navigator.pushNamed(context, HomeView.route);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff1d3c34).withOpacity(0.7),
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(width: 1, color: Colors.white24),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10, 50, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,

                    decoration: BoxDecoration(
                      color: Color(0xff9cfd96),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_forward, size: 18.sp),
                  ),
                  Text(
                    "Lets get started",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
