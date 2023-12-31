import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/res/generate_plan.dart';
import 'package:robofit/utils/colors.dart';

class GetName extends StatefulWidget {
  final String gender;
  final double height;
  final double weight;
  final double age;
  final String goal;
  final String location;
  final String level;
  final String selectedTime;

  const GetName({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
    required this.location,
    required this.level,
    required this.selectedTime,
    Key? key,
  }) : super(key: key);

  @override
  State<GetName> createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {
  String userName = '';

  bool get isNextButtonEnabled => userName.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: MyColors.textColor,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 0.5.h,
              width: 70.w,
              color: const Color.fromARGB(255, 10, 239, 193),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 4.h,
            ),
            const Text(
              "Your good name?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
              child: TextFormField(
                style: const TextStyle(
                  color: MyColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    child: const Icon(
                      Icons.person,
                      color: MyColors.newColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.newColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(width: 1, color: MyColors.newColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                  ),
                  fillColor: Colors.white,
                  hintText: "Enter your name",
                  errorStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 5.w,
        ),
        child: InkWell(
          onTap: isNextButtonEnabled
              ? () => Get.to(
                    GenerateFitnessPlan(
                      gender: widget.gender,
                      height: widget.height,
                      weight: widget.weight,
                      age: widget.age,
                      goal: widget.goal,
                      bodyPart: widget.location,
                      experience: widget.level,
                      workoutDays: widget.selectedTime,
                      equipment: "dumbels",
                    ),
                  )
              : null,
          child: Container(
            width: 90.w,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: isNextButtonEnabled ? MyColors.newColor : Colors.grey,
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Generate Plan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
