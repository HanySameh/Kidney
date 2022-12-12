import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/frame.dart';

import '../../config/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.landingRoute);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Frame(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: context.height * 0.12,
            ).animate().fade().scale(),
            SizedBox(
              height: context.height * 0.1,
            ),
            Image.asset(
              'assets/images/splash-image.jpeg',
              height: context.height * 0.2,
              width: context.width * 0.7,
              fit: BoxFit.cover,
            ).animate().fade().scale(),
          ],
          
        ),
      ),
    );
  }
}
