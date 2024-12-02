import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Screens/welcomescreen.dart';
import 'Screens/homescreen.dart';
import 'Screens/detailsscreen.dart';
import 'Screens/createuserscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/details': (context) => Detailsscreen(),
        '/create_user': (context) => CreateUserScreen(),
      },
    );
  }
}
