import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:unicec_mobi/utils/log.dart';

// screens
import 'package:unicec_mobi/screens/onboarding.dart';
import 'package:unicec_mobi/screens/pro.dart';
import 'package:unicec_mobi/screens/home.dart';
import 'package:unicec_mobi/screens/profile.dart';
import 'package:unicec_mobi/screens/register.dart';
import 'package:unicec_mobi/screens/articles.dart';
import 'package:unicec_mobi/screens/elements.dart';
import 'package:unicec_mobi/utils/router.dart';

import 'UI/login.dart';
import 'dependencies/app_dependencies.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Log.info("Handling a background message: ${message.messageId}");
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // name
    description: 'This channel is used for important notification',
    importance: Importance.high);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: "/onboarding",
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.getRoute(settings),
      //home: Login(),
    );
  }
}
