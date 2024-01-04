import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/utils/colors.dart';

class Outputscreen extends StatefulWidget {
  const Outputscreen({super.key});

  @override
  State<Outputscreen> createState() => _OutputscreenState();
}

class _OutputscreenState extends State<Outputscreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            //----->Top logo
            Positioned(
              top: 0.h,
              left: 0,
              right: 0,
              child: Container(
                color: MyColors.newColor,
                height: 30.h,
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      const Text(
                        "FITNESS PLAN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: MyColors.textColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //----->Main Coloumn
            Positioned(
              left: 0,
              right: 0,
              top: 15.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/bg-less.png",
                        height: 25.h,
                      ),
                    ),
                    const Text(
                      "Day 1",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: MyColors.accentColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text(
                      "Full Body Workout with Dumbbells",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B1B1B),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    rowCard(),
                    SizedBox(height: 1.h),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowCard() {
    int number;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: MyColors.primaryColor,
          radius: 3.w,
          child: const Text(
            "1",
            style: TextStyle(
              color: MyColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        const Expanded(
          child: Wrap(
            children: [
              Text(
                "5-10 minutes of light cardio (such as jogging or jumping jacks) to get your heart rate up and warm up your muscles.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1B1B1B),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
