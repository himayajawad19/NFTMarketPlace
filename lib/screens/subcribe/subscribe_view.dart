import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nftmarketplace/widgets/bg_widget.dart';

class SubscribeView extends ConsumerWidget {
  const SubscribeView({super.key});
  static const route = '/subscribe';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundWithCircles(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBackButtonSection(context),
                _buildDisplayContainer(),
                _nftPrice(),
                SizedBox(height: 6.h),
                _buildTitleText(),
                _buildDescText(),
                SizedBox(height: 16.h),
                _subscribeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButtonSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30.h, 16, 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 4.w),
          Text(
            "Back",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisplayContainer() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/images/6.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _nftPrice() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Container(
          height: 20.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(50.0),
            // border: Border.all(width: 1, color: Colors.white24),
          ),
          child: Center(
            child: Text(
              "10 ETH",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _buildTitleText() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Pixel Voyager",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: "  ",
          ),
          TextSpan(
            text: "By Alex Lee",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildDescText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Pixel Voyager captures the spirit of digital exploration — a lone traveler navigating the vast, colorful cosmos of the blockchain universe. This NFT symbolizes curiosity, innovation, and the endless journey into new virtual frontiers.",
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _subscribeButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(28.0),
          border: Border.all(color: Colors.white24, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, 4),
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28.0),
            onTap: () {
              // Implement subscription logic here
            },
            splashColor: Colors.white.withOpacity(0.15),
            highlightColor: Colors.white.withOpacity(0.05),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    "SUBSCRIBE",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
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
