import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/utils/colors.dart';

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
    // setState(() {});
    // String res = await AuthMethods().loginUser(
    //     email: _emailController.text, password: _passwordController.text);
    // if (res == "success") {
    //   setState(() {});
    //   // // ignore: use_build_context_synchronously
    //   // Navigator.of(context).pushReplacement(
    //   //   MaterialPageRoute(
    //   //     builder: (context) => const ResponsiveLayout(
    //   //         mobileScreenLayout: MobileScreenLayout()),
    //   //   ),
    //   // );
    // } else {
    //   setState(() {});

    // }
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
                height: 10.h,
              ),
              Image.asset(
                "assets/bg-less.png",
                height: 22.h,
              ),
              SizedBox(
                height: 4.h,
              ),

              //!EMAIL
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  hintText: "Email",
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),

              //!Password Validation

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Password",
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 5.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: TextButton(
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {},
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
