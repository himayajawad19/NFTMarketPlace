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
              children: [
                _buildBackButtonSection(context),
                _buildDisplayContainer(),
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
}
