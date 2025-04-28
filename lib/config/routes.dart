import 'package:flutter/material.dart';
import 'package:nftmarketplace/screens/home/home_view.dart';
import 'package:nftmarketplace/screens/introSlider/introSliderView.dart';
import 'package:nftmarketplace/screens/profile/profile_view.dart';
import 'package:nftmarketplace/screens/splash/splashView.dart';
import 'package:nftmarketplace/screens/subcribe/subscribe_view.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case Splashview.route:
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const Splashview(),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: a,
              curve: Curves.easeInOut,
            ),
          ),
          child: c,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      );
    case IntroSlider.route:
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const IntroSlider(),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: a,
              curve: Curves.easeInOut,
            ),
          ),
          child: c,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      );
    case HomeView.route:
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const HomeView(),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: a,
              curve: Curves.easeInOut,
            ),
          ),
          child: c,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      );
        case ProfileView.route:
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const ProfileView(),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: a,
              curve: Curves.easeInOut,
            ),
          ),
          child: c,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      );
      case SubscribeView.route:
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => const SubscribeView(),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: a,
              curve: Curves.easeInOut,
            ),
          ),
          child: c,
        ),
        transitionDuration: const Duration(milliseconds: 1000),
      );

      default:
      return errorRoute();

  }
}
Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}