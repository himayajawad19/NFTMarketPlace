import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundWithCircles extends StatelessWidget {
  final Widget child;
  const BackgroundWithCircles({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
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
        clipBehavior: Clip.none,
        children: [
          // Background Circles
          Positioned(right: 130.w, bottom: 550.h, child: _buildCircle(350.h, 280.h)),
          Positioned(right: 180.w, bottom: 520.h, child: _buildCircle(290.h, 280.h)),
          Positioned(left: 28.w, top: 430.h, child: _buildCircle(450.h, 480.h)),
          Positioned(
            left: 100.w,
            top: 400.h,
            child: _buildCircle(500.h, 520.h),
          ),

          child,
        ],
      ),
    );
  }

  Widget _buildCircle(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(115, 117, 117, 117),
        ),
      ),
    );
  }
}
