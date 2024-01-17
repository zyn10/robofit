import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/screens/input_6.dart';
import 'package:robofit/utils/colors.dart';

class GetGoals extends StatefulWidget {
  final String gender;
  final double height;
  final double weight;
  final double age;
  const GetGoals(
      {required this.gender,
      required this.height,
      required this.weight,
      required this.age,
      Key? key})
      : super(key: key);

  @override
  State<GetGoals> createState() => _GetGoalsState();
}

class _GetGoalsState extends State<GetGoals> {
  String selectedGoal = '';

  bool get isNextButtonEnabled => selectedGoal.isNotEmpty;

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
              width: 45.w,
              color: const Color.fromARGB(255, 10, 239, 193),
            ),
            Container(
              height: 0.5.h,
              width: 25.w,
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
              "What's your goal?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            buildGenderContainer(Icons.local_fire_department, "Loose weight"),
            buildGenderContainer(Icons.fitness_center, "Build muscle"),
            buildGenderContainer(Icons.directions_run, "Stay toned"),
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
                    GetLocation(
                      gender: widget.gender,
                      height: widget.height,
                      weight: widget.weight,
                      age: widget.age,
                      goal: selectedGoal,
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

  Widget buildGenderContainer(IconData icon, String text) {
    bool isSelected = selectedGoal == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = text;
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
                Icon(
                  icon,
                  color: Colors.grey,
                ),
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
              groupValue: selectedGoal,
              onChanged: (value) {
                setState(() {
                  selectedGoal = value.toString();
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
