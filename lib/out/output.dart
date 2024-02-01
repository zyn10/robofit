import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/utils/colors.dart';

import '../home/home.dart';

class Outputscreen extends StatefulWidget {
  final String generatedPlan;

  const Outputscreen({super.key, required this.generatedPlan});

  @override
  State<Outputscreen> createState() => _OutputscreenState();
}

class _OutputscreenState extends State<Outputscreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> workoutData =
        parseGeneratedPlan(widget.generatedPlan);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.newColor,
        leading: GestureDetector(
            onTap: () {
              Get.to(const Home());
            },
            child: Icon(
              Icons.arrow_back,
              size: 4.h,
            )),
      ),
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
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
                    SingleChildScrollView(
                      child: Column(
                        children: workoutData.map((dayData) {
                          return dayCard(
                            day: dayData['day'],
                            heading: dayData['heading'],
                            steps: dayData['steps'],
                          );
                        }).toList(),
                      ),
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

  Widget dayCard({
    required String day,
    required String heading,
    required List<String> steps,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DAY $day",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 10, 183, 148),
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF1B1B1B),
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        // Generate rows dynamically based on the steps
        for (int i = 0; i < steps.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowCard(
                number_: (i + 1).toString(),
                description_: steps[i],
              ),
              SizedBox(height: 1.h),
              if (i < steps.length - 1) const Divider(),
            ],
          ),
      ],
    );
  }

  Widget rowCard({
    required String number_,
    required String description_,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: MyColors.newColor,
          radius: 3.w,
          child: Text(
            number_,
            style: const TextStyle(
              color: MyColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Wrap(
            children: [
              Text(
                description_,
                style: const TextStyle(
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

  List<Map<String, dynamic>> parseGeneratedPlan(String generatedPlan) {
    List<Map<String, dynamic>> workoutData = [];

    List<String> days = generatedPlan.split('Day ');

    for (int i = 1; i < days.length; i++) {
      List<String> lines = days[i].split('\n');
      String day = lines[0].trim();
      String heading = lines[1].trim();

      List<String> steps = [];
      for (int j = 2; j < lines.length; j++) {
        if (lines[j].trim().isNotEmpty) {
          steps.add(lines[j].trim());
        }
      }

      workoutData.add({
        'day': day,
        'heading': heading,
        'steps': steps,
      });
    }

    return workoutData;
  }
}
