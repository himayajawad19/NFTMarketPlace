import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const route = "/homeView";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: Stack(
          children: [
            Positioned(
              left: 150.w,
              bottom: 580.h,

              child: Container(
                height: 330.h,
                width: 260.h,
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
              bottom: 540.h,

              child: Container(
                height: 330.h,
                width: 280.h,
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
              bottom: 610.h,

              child: SvgPicture.asset(
                'assets/sparkle.svg',
                height: 20.h,
                color: Color(0xFFaeff8d),
              ),
            ),
            Positioned(
              left: 250.w,
              bottom: 595.h,

              child: SvgPicture.asset(
                'assets/sparkle.svg',
                height: 10.h,
                color: Color(0xFFaeff8d),
              ),
            ),
            Positioned(
              right: 1.w,
              left: 1.w,
              bottom: 570.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey Olivia",
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "38.5M+ items in market ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 50.h,
                      width: 50.h,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white70),
                      ),
                      child: 
                      ClipOval(child: Image.asset("assets/profile.jpg", fit: BoxFit.cover,), )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
