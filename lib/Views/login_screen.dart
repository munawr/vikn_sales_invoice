import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aura_box/aura_box.dart';
import 'package:vikn_sales/Views/sales_estimate_screen.dart';

import '../Controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;


  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: authController.onWillPop,
        child: Scaffold(

      body: Stack(
        children: [
          AuraBox(
            spots: [
              AuraSpot(
                  color: Colors.purple[200] ?? Colors.purpleAccent,
                  radius: 300,
                  alignment: Alignment.bottomLeft,
                  blurRadius: 10.0,
                  stops: const [0.0, 2]),
              AuraSpot(
                color: Colors.lightBlue[100] ?? Colors.lightBlueAccent,
                radius: 250.0,
                alignment: Alignment.centerRight,
                blurRadius: 10.0,
                stops: const [0.0, 2],
              ),
              AuraSpot(
                color: Colors.yellow[100] ?? Colors.yellowAccent,
                radius: 250.0,
                alignment: Alignment.centerLeft,
                blurRadius: 10.0,
                stops: const [0.0, 2],
              ),
            ],
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(

                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset('assets/icons/language.svg',height: 24,width: 24,),
                                ),
                                const Text(
                                  "English",
                                  style: TextStyle(
                                    color: Color(0xff090909),
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 70,),
                          Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 21,
                              color: Colors.black,
                              height: 1.5,
                              letterSpacing: -0.06,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Login to your vikn account",
                              style: TextStyle(
                                color: Color(0xff838383),
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          const SizedBox(height:8 ,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 358,
                              height: 128,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(
                                  color: const Color(0xFFE6E6E6),
                                  width: 1, // Width 1px
                                ),
                              ),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent),
                                      ),
                                      labelText: 'Username',
                                      labelStyle: const TextStyle(
                                        color: Color(0xff838383),
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4285714285714286,
                                        letterSpacing: -0.06,
                                      ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/user.svg',
                                          width: 16,
                                          height: 16,
                                          color: const Color(0xff0A9EF3),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                    ),
                                  ),
                                  Obx(
                                    () => TextField(
                                      obscureText: !isPasswordVisible.value,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.transparent),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.transparent),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/pass.svg',
                                            width: 18.37,
                                            height: 18.37,
                                            color: const Color(0xff0A9EF3),
                                          ),
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            isPasswordVisible
                                                .toggle(); // Toggle only once
                                            print(isPasswordVisible.value);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: SvgPicture.asset(
                                              isPasswordVisible.value
                                                  ? 'assets/icons/passview.svg'
                                                  : 'assets/icons/passhide.svg',
                                              width: 18,
                                              height: 12,
                                              color: const Color(0xff0A9EF3),
                                            ),
                                          ),
                                        ),
                                        labelText: 'Password',
                                        labelStyle: const TextStyle(
                                          color: Color(0xff838383),
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4285714285714286,
                                          letterSpacing: -0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Forgotten Password?",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xff0a9ef3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: -0.06,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    child: Container(
                      width: 125,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E75F4),
                        borderRadius: BorderRadius.circular(120),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign in",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                    letterSpacing: -0.06,
                                    color: Colors.white,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: SvgPicture.asset(
                                      'assets/icons/loginarrow.svg'))
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      String username = usernameController.text.trim();
                      String password = passwordController.text.trim();
                      if (username.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Username and password are required',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      await authController.login(
                        username,
                        password,
                        true,
                      );

                        if (authController.isLoading.isFalse &&
                          authController.getAccessToken() != null )
                      {
                       // Get.to(() =>  SalesEstimate());
                        usernameController.clear();
                        passwordController.clear();
                      } else {
                        Get.snackbar(
                          'Error',
                          'Login failed',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                  ),
                  Obx(() {
                    return authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : const SizedBox.shrink();
                  }),
                  const SizedBox(height: 100,),
                  const Text(
                    "Don’t have an Account?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.3, // Equivalent to line-height: 23px
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                    textAlign:
                        TextAlign.center, // Explicitly setting text alignment
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign up now!",
                      style: TextStyle(
                        color: Color(0xff0A9EF3),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                        letterSpacing: -0.06,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
