import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/provider/user_provider.dart';
import 'package:robofit/utils/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getUser?.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.newColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: SizedBox(
                  height: 12.h,
                  width: 30.w,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          userProvider.getUser!.photoUrl,
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: SizedBox(
                          height: 42,
                          width: 42,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side:
                                    const BorderSide(color: MyColors.newColor),
                              ),
                              //Color: Colors.white,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Icon(
                                color: MyColors.newColor, Icons.verified),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                height: 7.h,
                decoration: BoxDecoration(
                    color: MyColors.newColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.person,
                      size: 2.5.h,
                    ),
                    SizedBox(width: 3.w),
                    text_widget("${userProvider.getUser!.fullname} ",
                        fontSize: 16.sp, fontWeight: FontWeight.w300)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                decoration: BoxDecoration(
                    color: const Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.email,
                      size: 2.5.h,
                    ),
                    SizedBox(width: 3.w),
                    text_widget("${userProvider.getUser!.email} ",
                        fontSize: 16.sp, fontWeight: FontWeight.w300)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                decoration: BoxDecoration(
                    color: const Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.cake,
                      size: 2.5.h,
                    ),
                    SizedBox(width: 3.w),
                    text_widget("${userProvider.getUser!.age} years ",
                        fontSize: 16.sp, fontWeight: FontWeight.w300)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                decoration: BoxDecoration(
                    color: const Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.fitness_center,
                      size: 2.5.h,
                    ),
                    SizedBox(width: 3.w),
                    text_widget("${userProvider.getUser!.weight} kg ",
                        fontSize: 16.sp, fontWeight: FontWeight.w300)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 7.h,
                decoration: BoxDecoration(
                    color: const Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.height,
                      size: 2.5.h,
                    ),
                    SizedBox(width: 3.w),
                    text_widget("${userProvider.getUser!.height} cm ",
                        fontSize: 16.sp, fontWeight: FontWeight.w300)
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                      color: MyColors.newColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget text_widget(String text,
      {fontSize,
      color,
      fontWeight,
      decoration,
      textAlign,
      letterSpacing,
      maxline,
      bool isShadow = false}) {
    return Text(
      text,
      maxLines: maxline,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 17.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
