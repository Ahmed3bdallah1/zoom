import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_services.dart';
import 'package:zoom/screens/bottom_navigation_bar_config.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/screens/login_page.dart';
import 'package:zoom/screens/video_call_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthModels authModels = AuthModels();
    return MaterialApp(
      title: 'zoom clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        // scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black26, useMaterial3: true),
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        HomeScreen.route: (context) => const HomeScreen(),
        VideoCallScreen.route:(context)=>const VideoCallScreen()
      },
      home: StreamBuilder(
        stream: authModels.authChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blueGrey));
          }
          return snapshot.hasData ? const NavigationBarConfig() : const LoginPage();
        },
      ),
    );
  }
}
