
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';                               
import 'package:flutter_application_120/Authenticate/Autheticate.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );


  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    // Navigate to the correct screen depending on the message received
  });

  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    print('The app was opened from a message: ${initialMessage}');

  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}


