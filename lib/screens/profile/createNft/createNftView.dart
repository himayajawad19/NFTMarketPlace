import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/widgets/bg_widget.dart';

class Createnftview extends ConsumerWidget {
  const Createnftview({super.key});
  static const route = "/createnftview";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: BackgroundWithCircles(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButtonSection(context),
                  _buildTitleText(),
                  _createNftForm(),
                  _buildDisplayContainer(),

                  _subscribeButton(),
                ],
              ),
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

  Widget _buildTitleText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Text(
        "Create your NFT",
        style: TextStyle(
          fontSize: 24.sp,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _createNftForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white70,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2.h),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white70, 
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Description",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white70,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2.h),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white70,
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Generate Image",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white70,
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
        child: GestureDetector(
          child: Container(
            height: 250.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.white70),
            ),
            child: Center(
              child: Text(
                "Tap to generate",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _subscribeButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
              child: Text(
                "Add NFT",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
