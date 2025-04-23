import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
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
                      child: Container(
                        height: 330.h,
                        width: 250.h, // Add width to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(115, 117, 117, 117),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 180.w,
                      bottom: 530.h,
                      child: Container(
                        height: 330.h,
                        width: 250.h, // Add width to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(115, 117, 117, 117),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 280.w,
                      bottom: 600.h,
                      child: SvgPicture.asset(
                        'assets/sparkle.svg',
                        height: 50.h,
                        color: Color(0xFFaeff8d),
                      ),
                    ),
                    Positioned(
                      left: 230.w,
                      bottom: 550.h,
                      child: SvgPicture.asset(
                        'assets/sparkle.svg',
                        height: 30.h,
                        color: Color(0xFFaeff8d),
                      ),
                    ),

                    centerText(),
                    Positioned(
                      left: 150.w,
                      top: 560.h,
                      child: Container(
                        height: 330.h,
                        width: 250.h, // Add width to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(115, 117, 117, 117),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 180.w,
                      top: 530.h,
                      child: Container(
                        height: 330.h,
                        width: 250.h, // Add width to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(115, 117, 117, 117),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 290.w,
                      top: 585.h,
                      child: SvgPicture.asset(
                        'assets/sparkle.svg',
                        height: 30.h,
                        color: Color(0xFFaeff8d),
                      ),
                    ),
                    centerButton()
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
    return Padding(
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
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Colors.white, // Custom color for "Sell"
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                "Sell",
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Color(0xFFaeff8d), // Custom color for "Sell"
                ),
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
        ],
      ),
    );
  }

  Widget centerButton() {
    return
       Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(width: 1, color: Colors.white),
        ),
        child: Center(child: Text("Lets get started!")),
      
    );
  }
}
