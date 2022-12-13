import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidney/config/routes/routes.dart';
import 'package:kidney/view/screens/call_doctor_screen.dart';
import 'package:kidney/view/screens/emergency_screen.dart';
import 'package:kidney/view/screens/food_screen.dart';
import 'package:kidney/view/screens/home_screen.dart';
import 'package:kidney/view/screens/info_register_screen.dart';
import 'package:kidney/view/screens/landing.dart';
import 'package:kidney/view/screens/learn_more.dart';
import 'package:kidney/view/screens/log_in_screen.dart';
import 'package:kidney/view/screens/basic_register_screen.dart';
import 'package:kidney/view/screens/more_info_register_screen.dart';
import 'package:kidney/view/screens/notify_info_screen.dart';
import 'package:kidney/view/screens/treatment_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../view/screens/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case Routes.registerRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return BasicRegisterScreen();
          },
        );
      case Routes.infoRegisterRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: InfoRegisterScreen(),
            );
          },
        );
      case Routes.moreInfoRegisterRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: MoreInfoRegisterScreen(),
            );
          },
        );
      case Routes.notifyInfoRegisterRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: NotifyInfoScreen(),
            );
          },
        );
      case Routes.loginRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: LoginScreen(),
            );
          },
        );
      case Routes.callDoctorRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: CallYourDoctorScreen(),
            );
          },
        );
      case Routes.homeRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case Routes.emergencyRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: EmergencyScreen(),
            );
          },
        );
      case Routes.treatmentRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: TreatmentScreen(),
            );
          },
        );
      case Routes.foodRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: FoodScreen(),
            );
          },
        );
      case Routes.learnMoreRoute:
        return CupertinoPageRoute(
          builder: (context) {
            return const Directionality(
              textDirection: TextDirection.rtl,
              child: LearnMoreScreen(),
            );
          },
        );
      case Routes.landingRoute:
        return CupertinoPageRoute(
          builder: (_) => const LandingPage(),
          settings: routeSettings,
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return CupertinoPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
