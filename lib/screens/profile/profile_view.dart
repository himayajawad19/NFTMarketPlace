import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftmarketplace/widgets/bg_widget.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  static const route = "/profileView"; // fixed typo here

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundWithCircles(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBackButtonSection(context),
                _buildProfileHeader(),
                _profileInfo(),
                _buildProfileInfoGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButtonSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30.h, 16, 30.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20.sp,
            ),
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

  Widget _buildProfileHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              image: const DecorationImage(
                image: AssetImage("assets/images/1.jpg"), // Update your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 120.h,
          left: 148.w,
          child: Container(
            height: 60.h,
            width: 60.h,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white70),
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/profile.jpg", // Update your profile image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "@7ONDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              followButton(),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 20.h,
                width: 130.w,
                child: Text(
                  "0xAb5801a7D398351b8bE11C439e05",
                  style: TextStyle(
                    color: Colors.white70.withOpacity(0.4),
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(Icons.copy_rounded, color: Colors.white70.withOpacity(0.4)),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Blockchain enthusiast and technology explorer. Passionate about decentralized systems, smart contracts, and creating innovative digital solutions.',
            style: TextStyle(
              color: Colors.white70.withOpacity(0.4),
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfoGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      shrinkWrap: true,
      childAspectRatio: 1.5,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        _buildGridItem("Following", "120"),
        _buildGridItem("Followers", "1.5K"),
        _buildGridItem("Posts", "35"),
        _buildGridItem("Likes", "428"),
        
      ],
    );
  }

  Widget _buildGridItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 0.7, color: Colors.white70),
        color: Colors.white70.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget followButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: const Color(0xFFaeff8d).withOpacity(0.7),
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(width: 1, color: Colors.white24),
          ),
          child: Center(
            child: Text(
              "Add NFT",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}