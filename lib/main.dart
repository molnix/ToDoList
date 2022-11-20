import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simpletodo/models/note_model.dart';

import 'package:simpletodo/pages/home_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
  FlutterLocalNotificationsPlugin();

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid = 
    AndroidInitializationSettings('ic_launcher');
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await Hive.initFlutter();
  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

void scheduleAlarm(DateTime scheduleNotificationDateTime, int id, String body) async{

  var androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'alarm_notific',
      'alarm_notofic',);

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.schedule(
    id,
    'SimpleToDo', 
    body, 
    scheduleNotificationDateTime, 
    platformChannelSpecifics);
}