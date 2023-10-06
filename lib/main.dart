import 'package:flutter/material.dart';
import 'package:sakthi_amma/pages/home_page/home.dart';
import 'package:sakthi_amma/splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sripuram Live',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: AnimatedSplashScreen(
        splash:  "assets/images/sakthi_amma.png",
        splashIconSize: double.infinity,
      nextScreen: MyHomePage(title: 'Sakthi Amma'),
      backgroundColor: Color(0xfff7f4e7),
      duration: 3000,)
    
    
    );
  }

}