import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/home/home.dart';
import 'package:robofit/utils/colors.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> workoutData =
    //     parseGeneratedPlan(widget.generatedPlan);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      appBar: AppBar(
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
                height: 25.h,
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
            Positioned(
              bottom: 0.h,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(255, 246, 246, 246),
                height: 75.h,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          dayCard(
                              day: "1",
                              heading: "Cardio and Strength Training",
                              steps: [
                                "Warm up: 5-10 minutes of light jogging or jumping jacks",
                                "Cardio: Go for a 30-45 minute jog in the park. You can also incorporate intervals or hill sprints to increase intensity.",
                                "Strength Training Circuit (3 sets of 10-12 reps per exercise):\n1. Push-ups2. Bodyweight squats\n3. Lunges4. Plank\n5. Bicycle crunches\n6. Superman exercise"
                              ]),
                          SizedBox(
                            height: 3.h,
                          ),
                          dayCard(
                              day: "2",
                              heading: "Cardio and Strength Training",
                              steps: [
                                "Warm up: 5-10 minutes of light jogging or jumping jacks",
                                "Cardio: Go for a 30-45 minute jog in the park. You can also incorporate intervals or hill sprints to increase intensity.",
                                "Strength Training Circuit (3 sets of 10-12 reps per exercise):\n1. Push-ups2. Bodyweight squats\n3. Lunges4. Plank\n5. Bicycle crunches\n6. Superman exercise"
                              ]),
                          SizedBox(
                            height: 3.h,
                          ),
                          dayCard(
                              day: "3",
                              heading: "Cardio and Strength Training",
                              steps: [
                                "Warm up: 5-10 minutes of light jogging or jumping jacks",
                                "Cardio: Go for a 30-45 minute jog in the park. You can also incorporate intervals or hill sprints to increase intensity.",
                                "Strength Training Circuit (3 sets of 10-12 reps per exercise):\n1. Push-ups2. Bodyweight squats\n3. Lunges4. Plank\n5. Bicycle crunches\n6. Superman exercise"
                              ]),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    ),
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
                        height: 20.h,
                      ),
                    ),
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: workoutData.map((dayData) {
                    //       return dayCard(
                    //         day: dayData['day'],
                    //         heading: dayData['heading'],
                    //         steps: dayData['steps'],
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
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
    return Container(
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 70,
            offset: const Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 3.h,
          horizontal: 3.h,
        ),
        child: Column(
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
        ),
      ),
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
