import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/screens/input_4.dart';
import 'package:robofit/utils/colors.dart';

class GetWeight extends StatefulWidget {
  final double height;

  const GetWeight({required this.height, Key? key}) : super(key: key);
  @override
  State<GetWeight> createState() => _GetWeightState();
}

class _GetWeightState extends State<GetWeight> {
  double weight = 72.0;

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
                  width: 30.w,
                  color: const Color.fromARGB(255, 10, 239, 193),
                ),
                Container(
                  height: 0.5.h,
                  width: 40.w,
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
                  "Weight",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "(kg)",
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
                      weight--;
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
                  '${weight.toInt()}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 20.w),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weight++;
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
            Get.to(GetAge(
              height: widget.height,
              weight: weight,
            ));
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
