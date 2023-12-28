import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/screens/input_2.dart';
import 'package:robofit/utils/colors.dart';

class InputDetails extends StatefulWidget {
  const InputDetails({Key? key}) : super(key: key);

  @override
  State<InputDetails> createState() => _InputDetailsState();
}

class _InputDetailsState extends State<InputDetails> {
  String selectedGender = '';

  bool get isNextButtonEnabled => selectedGender.isNotEmpty;

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
              width: 10.w,
              color: const Color.fromARGB(255, 10, 239, 193),
            ),
            Container(
              height: 0.5.h,
              width: 60.w,
              color: MyColors.backgroundColor,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Gender",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildGenderContainer(Icons.female, "Female"),
            buildGenderContainer(Icons.male, "Male"),
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
          onTap: isNextButtonEnabled ? () => Get.to(const GetHeight()) : null,
          child: Container(
            width: 90.w,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isNextButtonEnabled ? MyColors.newColor : Colors.grey,
            ),
            child: Padding(
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
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = text;
        });
      },
      child: Container(
        width: 90.w,
        margin: EdgeInsets.all(1.h),
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 209, 209, 209)),
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
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value.toString();
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
