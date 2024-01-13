import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controllers/sales_controller.dart';
import 'Views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  Get.put(SalesController());
  runApp(const MyApp());
}

Future<void> initSharedPreferences() async {
  await Get.putAsync(() async => await SharedPreferences.getInstance());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initSharedPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'VIKN Sales',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0A9EF3)),
              useMaterial3: true,
            ),
            home: LoginPage(),
          );
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
