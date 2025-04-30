import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nftmarketplace/screens/home/home_state.dart';
import 'package:nftmarketplace/screens/home/home_view_model.dart';
import 'package:nftmarketplace/screens/profile/profile_view.dart';
import 'package:nftmarketplace/screens/subcribe/subscribe_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const route = "/homeView";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVm = ref.read(homeProvider.notifier);
    final homeState = ref.watch(homeProvider);
    return SafeArea(
      child: Scaffold(
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

          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderSection(context, homeState),
                SizedBox(height: 16.h),
                _nftSlide(homeVm),

                SizedBox(height: 8.h),
                Container(
                  height: MediaQuery.of(context).size.height * 0.331,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Top collections",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: _topCollectionSlide(homeVm)),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Featured Creator",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "View More",
                              style: TextStyle(
                                color: Color(0xff9cfd96),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildFeaturedCreatorsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context, HomeState homeState) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 80.w,
            bottom: 20.h,
            child: Container(
              height: 350.h,
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
            left: 150.w,
            bottom: 12.h,

            child: Container(
              height: 290.h,
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
            left: 250.w,
            bottom: 50.h,

            child: SvgPicture.asset(
              'assets/sparkle.svg',
              height: 20.h,
              color: Color(0xFFaeff8d),
            ),
          ),
          Positioned(
            left: 220.w,
            bottom: 30.h,
            child: SvgPicture.asset(
              'assets/sparkle.svg',
              height: 10.h,
              color: Color(0xFFaeff8d),
            ),
          ),
          Padding(
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
                    Row(
                      children: [
                        Icon(Icons.wallet_rounded, color: Colors.white70),
                        SizedBox(width: 2.w),
                        Text(
                          "${homeState.balance?.toStringAsFixed(2)??0.0} ETH",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProfileView.route);
                  },
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white70),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/profile.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nftSlide(HomeViewModel homeVm) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeVm.topCollection.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                index == 0
                    ? EdgeInsets.fromLTRB(8, 0, 16, 0)
                    : EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Stack(
              children: [
                SizedBox(
                  height: 180.h,
                  width: 240.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      homeVm.topCollection[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _subscribeButton(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _topCollectionSlide(HomeViewModel homeVm) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeVm.topCollection.length,
        itemBuilder: (context, index) {
          homeVm.topCollection.sort((a, b) => b.compareTo(a));
          return Padding(
            padding:
                index == 0
                    ? EdgeInsets.fromLTRB(8, 0, 16, 0)
                    : EdgeInsets.fromLTRB(0, 0, 16, 0),

            child: Container(
              width: 170.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.7, color: Colors.white70),
                color: Colors.white70.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 170.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        homeVm.topCollection[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: Row(
                      children: [
                        Text(
                          "Petriet Alex",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.favorite, color: Colors.red.shade900),
                        SizedBox(width: 2.w),
                        Text(
                          "1K",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedCreatorsList() {
    return Column(
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white70),
                ),
                child: ClipOval(
                  child: Image.asset("assets/profile.jpg", fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olivia Silver",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "10K Followers",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              followButton(),
            ],
          ),
        );
      }),
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

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Follow",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _subscribeButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SubscribeView.route);
      },

      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50.0),
            border: const Border(
              right: BorderSide(
                color: Color(0xFFaeff8d), // Color of the left border
                width: 2, // Thickness of the left border
              ),
              top: BorderSide(
                color: Color(0xFFaeff8d), // Color of the left border
                width: 1, // Thickness of the left border
              ),
              
            ),

           
          ),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Subscribe",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return SizedBox();
  }
}
