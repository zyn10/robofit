import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/screens/input_9.dart';

import '../utils/colors.dart';

class GetTimes extends StatefulWidget {
  final String gender;
  final double height;
  final double weight;
  final double age;
  final String goal;
  final String location;
  final String level;

  const GetTimes(
      {required this.gender,
      required this.height,
      required this.weight,
      required this.age,
      required this.goal,
      required this.location,
      required this.level,
      super.key});

  @override
  State<GetTimes> createState() => _GetTimesState();
}

class _GetTimesState extends State<GetTimes> {
  String selectedTime = '';

  bool get isNextButtonEnabled => selectedTime.isNotEmpty;

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
              width: 65.w,
              color: const Color.fromARGB(255, 10, 239, 193),
            ),
            Container(
              height: 0.5.h,
              width: 5.w,
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
              "How often do\nyou workout?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            buildGenderContainer("1 day a week"),
            buildGenderContainer("2 days a week"),
            buildGenderContainer("3 days a week"),
            buildGenderContainer("4 days a week"),
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
                    GetName(
                      gender: widget.gender,
                      height: widget.height,
                      weight: widget.weight,
                      age: widget.age,
                      goal: widget.goal,
                      location: widget.location,
                      level: widget.level,
                      selectedTime: selectedTime,
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

  Widget buildGenderContainer(String text) {
    bool isSelected = selectedTime == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = text;
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
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(width: 1.w),
            CustomRadio(
              value: text,
              groupValue: selectedTime,
              onChanged: (value) {
                setState(() {
                  selectedTime = value.toString();
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
