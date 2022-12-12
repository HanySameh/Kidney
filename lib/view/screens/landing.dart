import 'package:flutter/material.dart';
import 'package:kidney/core/utils/constants.dart';
import 'package:kidney/view/screens/home_screen.dart';

import 'basic_register_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return login != null ? const HomeScreen() : BasicRegisterScreen();
  }
}
