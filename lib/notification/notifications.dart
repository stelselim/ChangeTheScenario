import 'dart:math';
import 'package:changescenario/classes/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future setFilmEventNotification(FilmEvent filmEvent) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'Change The Scenario',
    'Movie Time',
    '',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
    channelShowBadge: true,
    enableVibration: true,
    playSound: true,
  );
  const iOSPlatformChannelSpecifics = IOSNotificationDetails(
    badgeNumber: 0,
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );
  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  // Make Local Date
  final localDate = filmEvent.toWatchTime.toDate();
  int id = Random().nextInt(100000);

  // print(id);
  await flutterLocalNotificationsPlugin.schedule(
    id,
    '${filmEvent.filmName}',
    "Watch Together, Movie Time!",
    localDate,
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
  );
}

Future deleteNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // cancel the notification with id value of zero
  await flutterLocalNotificationsPlugin.cancel(0);
}

Future deleteAllNotifications() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // cancel the notification with id value of zero
  await flutterLocalNotificationsPlugin.cancelAll();
}
