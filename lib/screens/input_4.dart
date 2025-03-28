import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/screens/input_5.dart';
import 'package:robofit/utils/colors.dart';

class GetAge extends StatefulWidget {
  final String gender;
  final double height;
  final double weight;
  const GetAge(
      {required this.gender,
      required this.height,
      required this.weight,
      Key? key})
      : super(key: key);

  @override
  State<GetAge> createState() => _GetAgeState();
}

class _GetAgeState extends State<GetAge> {
  double age = 22.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(context),
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            Row(
              children: [
                Container(
                  height: 0.5.h,
                  width: 40.w,
                  color: const Color.fromARGB(255, 10, 239, 193),
                ),
                Container(
                  height: 0.5.h,
                  width: 30.w,
                  color: MyColors.backgroundColor,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Age",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "(years)",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      age--;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.newColor,
                    shape: const CircleBorder(), // Make the button circular
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: MyColors.textColor,
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  '${age.toInt()}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 20.w),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      age++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.newColor,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: MyColors.textColor,
                  ),
                ),
              ],
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
          onTap: () {
            Get.to(GetGoals(
                gender: widget.gender,
                height: widget.height,
                weight: widget.weight,
                age: age));
          },
          child: Container(
            width: 90.w,
            height: 6.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: MyColors.newColor,
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Next",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.textColor,
                  fontSize: 22,
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
