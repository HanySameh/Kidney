import 'package:flutter/material.dart';
import 'package:kidney/config/theme/app_theme.dart';
import 'package:kidney/core/utils/app_strings.dart';
import 'package:provider/provider.dart';

import '../config/routes/router.dart';
import '../services/auth_services.dart';

class Kidney extends StatelessWidget {
  const Kidney({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
