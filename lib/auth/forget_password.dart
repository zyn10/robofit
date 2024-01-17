import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Forget Password",
            style: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "Opps. It happens to the best of us. Input your\nemail to fix the issue.",
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
