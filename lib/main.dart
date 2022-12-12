import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidney/cache.dart';
import 'package:kidney/core/app.dart';
import 'package:kidney/services/notification_services.dart';

import 'core/utils/constants.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initializeNotification();
  NotificationServices()
      .displayNotification(title: "Welcome to our app", body: "good luck!");
  NotificationServices().afterOpenApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Cache.init();
  login = Cache.getData(key: 'login');
  runApp(const Kidney());
}
