import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:robofit/out/output.dart';
import 'package:robofit/utils/colors.dart';

class GenerateFitnessPlan extends StatelessWidget {
  final String gender;
  final double height;
  final double weight;
  final double age;
  final String goal;
  final String trainingLocation;
  final String experience;
  final String workoutDays;

  const GenerateFitnessPlan({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
    required this.trainingLocation,
    required this.experience,
    required this.workoutDays,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: generateFitnessPlan(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoadingScreen();
        } else if (snapshot.hasError) {
          return buildErrorScreen(snapshot.error);
        } else {
          final String generatedPlan = snapshot.data!;
          return buildSuccessScreen(generatedPlan);
        }
      },
    );
  }

  Widget buildLoadingScreen() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.newColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Generating Fitness Plan",
          style: TextStyle(
            color: MyColors.textColor,
          ),
        ),
      ),
      body: const Center(
          child: CircularProgressIndicator(
        color: MyColors.newColor,
      )),
    );
  }

  Widget buildErrorScreen(dynamic error) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.newColor,
        automaticallyImplyLeading: false,
        title: Text(
          error,
          style: const TextStyle(
            color: MyColors.textColor,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Failed to generate fitness plan: $error',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildSuccessScreen(String generatedPlan) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.newColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Fitness Plan",
          style: TextStyle(
            color: MyColors.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Robofit_logo.png'),
                        fit: BoxFit
                            .cover, // Adjust the BoxFit property as needed
                      ),
                    ),
                  ),
                  const Text(
                    "Based on the information provided, here is your fitness plan:",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  buildWorkoutList(generatedPlan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToOutputScreen(String generatedPlan) {
    Get.to(() => Outputscreen(generatedPlan: generatedPlan));
  }

  Widget buildWorkoutList(String generatedPlan) {
    navigateToOutputScreen(generatedPlan);
    return SizedBox.shrink(); // Return an empty widget or null if necessary
  }

  Future<String> generateFitnessPlan() async {
    final userMessage = """
      1- $gender
      2- $height cm
      3- $weight kg
      4- $age years
      5- $goal
      6- $trainingLocation
      7- $experience
      8- $workoutDays times per week

    """;

    final requestData = {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {
          'role': 'system',
          'content': """
          I will provide you with
          1- Gender
          2- Height
          3- Weight
          4- Age
          5- Goal i.e building muscle or Stay toned or lose weight 
          6- Training Location which i have access to
          7- My Experience with fitness i.e beginner, intermediate, advance etc
          8- How often I can work out i.e times a week.

          Generate a plan tailored to achieve the specified goals, considering the given conditions. Please ensure the plan is designed for the specified number of days in the following structure
          Day Number
          Heading of Workoutofthe day like "Upper Body Strength"
          Steps of the day
          number : heading : time : discription
          eg
          1: Warmup: 5 mins : perform jogging in a place and jumping jacks
          2: Dumbbell Bench Press: 20 mins : perform 3 sets of 12 reps
          """
        },
        {'role': 'user', 'content': userMessage},
      ],
    };

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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', // Replace with your actual API key
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['choices'][0]['message']['content'] as String;
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error']['message'];
        throw Exception('Failed to generate fitness plan: $errorMessage');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
