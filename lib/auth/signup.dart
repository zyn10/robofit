import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/auth/login.dart';
import 'package:robofit/resources/auth_methods.dart';
import 'package:robofit/utils/colors.dart';
import 'package:robofit/utils/utils.dart';

class OurSignUp extends StatefulWidget {
  const OurSignUp({Key? key}) : super(key: key);

  @override
  State<OurSignUp> createState() => _OurSignUpState();
}

class _OurSignUpState extends State<OurSignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  Uint8List? _image;

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List? image = await pickImage(ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  Future<void> signUpUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        height: _heightController.text,
        fullname: _fullNameController.text,
        weight: _weightController.text,
        age: _ageController.text,
        file: _image!,
      );
      setState(() {
        _isLoading = false;
      });
      if (res != 'success') {
        // ignore: use_build_context_synchronously
        showSnackBar(context, res);
      } else {
        Get.to(const OurLogin());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      "ROBOFIT SIGNUP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 56,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 56,
                                  backgroundImage: NetworkImage(
                                      "https://t3.ftcdn.net/jpg/02/10/49/86/360_F_210498655_ywivjjUe6cgyt52n4BxktRgDCfFg8lKx.jpg"),
                                ),
                          Positioned(
                            bottom: -5,
                            left: 70,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        hintText: "Full Name",
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        if (!RegExp(r'^[a-zA-Z -]+$').hasMatch(value)) {
                          return 'Invalid full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        }
                        if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                          return 'Invalid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.accessibility),
                        hintText: "Age",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Invalid age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        hintText: "Height (cm)",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your height';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Invalid height';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.fitness_center),
                        hintText: "Weight (kg)",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your weight';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Invalid weight';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Password",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_open),
                        hintText: "Confirm Password",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ElevatedButton(
                      onPressed: signUpUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.newColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: const Size(350, 50),
                      ),
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('Sign Up'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const OurLogin();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                          ),
                          child: const Text(
                            "Login here",
                            style: TextStyle(
                              color: Color.fromARGB(255, 133, 133, 133),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
