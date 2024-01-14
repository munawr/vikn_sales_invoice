import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() =>  LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _initializeApp(context),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                    width: 230,
                    child: Image.asset('assets/icons/appiconblue.png')),
                const SizedBox(
                  height: 30,
                ),
                const CircularProgressIndicator(),
                const Spacer(
                  flex: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
