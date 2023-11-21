import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_services.dart';
import 'package:zoom/screens/home_screen.dart';
import 'package:zoom/utilits/page_route_transition.dart';
import 'package:zoom/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  static const route="loginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthModels authModels = AuthModels();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  "Start or join meetings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/zoom.png",
                  height: 200,
                ),
              ],
            ),
            Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                    message: "Google sign in",
                    onPressed: () async {
                      bool result = await authModels.signInWithGoogle(context);
                      if (result==true) {
                        Navigator.pushReplacementNamed(context, HomeScreen.route);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
