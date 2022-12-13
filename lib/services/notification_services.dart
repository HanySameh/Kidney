import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:kidney/models/notify_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String selectedNotificationPayload = '';

  Future<void> initializeNotification() async {
    tz.initializeTimeZones();
    _configureLocalTimeZone();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> displayNotification(
      {required String title, required String body}) async {
    debugPrint('doing test');
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> afterOpenApp() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'KIDNEY',
      'Nice Time!',
      tz.TZDateTime.now(tz.local).add(const Duration(minutes: 4)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'Reminder|Nice Time!|${DateTime.now()}|',
    );
  }

  Future<void> scheduledNotification(
      int hour, int minutes, NotifyModel model) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'KIDNEY',
      'Medication time',
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
      _nextInstanceOfTenAM(
          hour, minutes, model.remind!, model.repeat!, model.date!),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'Reminder|Medication time|${DateTime.now()}|',
    );
  }

  tz.TZDateTime _nextInstanceOfTenAM(
      int hour, int minutes, int remind, String repeat, String date) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    var formattedDate = DateFormat.yMd().parse(date);
    final tz.TZDateTime fd = tz.TZDateTime.from(formattedDate, tz.local);

    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, fd.year, fd.month, fd.day, hour, minutes);
    scheduledDate = taskRemind(remind, scheduledDate);
    if (scheduledDate.isBefore(now)) {
      if (repeat == 'يومي') {
        scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
            (formattedDate.day) + 1, hour, minutes);
      }
      if (repeat == 'اسبوعي') {
        scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
            (formattedDate.day) + 7, hour, minutes);
      }
      if (repeat == 'شهري') {
        scheduledDate = tz.TZDateTime(tz.local, now.year,
            (formattedDate.month) + 1, formattedDate.day, hour, minutes);
      }
      scheduledDate = taskRemind(remind, scheduledDate);
    }
    debugPrint(scheduledDate.toString());
    return scheduledDate;
  }

  tz.TZDateTime taskRemind(int remind, tz.TZDateTime scheduledDate) {
    if (remind == 5) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 5));
    }
    if (remind == 10) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 10));
    }
    if (remind == 15) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 15));
    }
    if (remind == 20) {
      scheduledDate = scheduledDate.subtract(const Duration(minutes: 20));
    }
    debugPrint(scheduledDate.toString());
    return scheduledDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }
}
