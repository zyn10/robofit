import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/screens/input_8.dart';

import '../utils/colors.dart';

class GetExperience extends StatefulWidget {
  final String gender;
  final double height;
  final double weight;
  final double age;
  final String goal;
  final String location;

  const GetExperience(
      {required this.gender,
      required this.height,
      required this.weight,
      required this.age,
      required this.goal,
      required this.location,
      super.key});

  @override
  State<GetExperience> createState() => _GetExperienceState();
}

class _GetExperienceState extends State<GetExperience> {
  String selectedExp = '';

  bool get isNextButtonEnabled => selectedExp.isNotEmpty;

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
              width: 50.w,
              color: const Color.fromARGB(255, 10, 239, 193),
            ),
            Container(
              height: 0.5.h,
              width: 20.w,
              color: MyColors.backgroundColor,
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
              "Choose your level",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            buildGenderContainer(
                "Beginner", "I rarely exercise and prefer low intensity"),
            buildGenderContainer("Intermediate", "i can do moderate workouts"),
            buildGenderContainer(
                "Advanced", "i have yeares of experience working out"),
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
                    GetTimes(
                      gender: widget.gender,
                      height: widget.height,
                      weight: widget.weight,
                      age: widget.age,
                      goal: widget.goal,
                      location: widget.location,
                      level: selectedExp,
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
                "Next",
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

  Widget buildGenderContainer(String text, String desc) {
    bool isSelected = selectedExp == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedExp = text;
        });
      },
      child: Container(
        width: 90.w,
        margin: EdgeInsets.all(1.h),
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? MyColors.newColor
                : const Color.fromARGB(255, 209, 209, 209),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        desc,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 1.w),
            CustomRadio(
              value: text,
              groupValue: selectedExp,
              onChanged: (value) {
                setState(() {
                  selectedExp = value.toString();
                });
              },
              selectedColor: MyColors.newColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Color selectedColor;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.selectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        width: 6.w,
        height: 5.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: groupValue == value ? selectedColor : Colors.transparent,
          border: Border.all(color: const Color.fromARGB(255, 223, 223, 223)),
        ),
        child: Center(
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: groupValue == value ? selectedColor : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
