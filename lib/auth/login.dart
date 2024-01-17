import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/auth/forget_password.dart';
import 'package:robofit/auth/signup.dart';
import 'package:robofit/home/home.dart';
import 'package:robofit/utils/colors.dart';
import 'package:robofit/utils/utils.dart';

import '../resources/auth_methods.dart';

class OurLogin extends StatefulWidget {
  const OurLogin({super.key});

  @override
  State<OurLogin> createState() => _OurLoginState();
}

class _OurLoginState extends State<OurLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUserFun() async {
    setState(() {});
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == "success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
      setState(() {});
      // ignore: use_build_context_synchronously
      Get.to(const Home());
    } else {
      setState(() {});
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Image.asset(
                "assets/bg-less.png",
                height: 22.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  prefixIcon: const Icon(
                    Icons.alternate_email,
                    color: MyColors.newColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.newColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                  ),
                  fillColor: Colors.white,
                  hintText: "Email",
                  errorStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  prefixIcon: const Icon(
                    Icons.password,
                    color: MyColors.newColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.newColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                  ),
                  fillColor: Colors.white,
                  hintText: "Password",
                  errorStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(const ForgetPasswordScreen());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 102, 255),
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: MyColors.newColor,
                ),
                onPressed: () {
                  loginUserFun();
                },
                child: const Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Get.to(const OurSignUp());
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(10, 30)),
                    child: const Text(
                      "Sign up here",
                      style: TextStyle(
                        color: Color.fromARGB(255, 133, 133, 133),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
//Transition to signup
            ],
          ),
        ),
      ),
    );
  }
}
