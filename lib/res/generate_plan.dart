import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:robofit/utils/colors.dart';

class GenerateFitnessPlan extends StatelessWidget {
  final String gender;
  final double height;
  final double weight;
  final double age;
  final String goal;
  final String bodyPart;
  final String experience;
  final String workoutDays;
  final String equipment;

  const GenerateFitnessPlan({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
    required this.bodyPart,
    required this.experience,
    required this.workoutDays,
    required this.equipment,
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
      appBar: AppBar(title: const Text('Generating Fitness Plan...')),
      body: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildErrorScreen(dynamic error) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
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
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          generatedPlan,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Future<String> generateFitnessPlan() async {
    final userMessage = """
      1- $gender
      2- $height ft
      3- $weight kg
      4- $age years
      5- $goal
      6- $bodyPart
      7- $experience
      8- $workoutDays times per week
      9- $equipment
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
          5- Goal i.e building muscle or keep fit or lose weight 
          6- Parts of the body I want to focus i.e chest, triceps, lats, biceps, shoulder, abs etc
          7- My Experience with fitness i.e totally newbie, beginner, intermediate, advance etc
          8- How often I can work out i.e times a week.
          9- Equipment I have i.e no equipment, dumbbells, access to a full gym etc.
          
          You need to give me a fitness plan to achieve my goals by keeping in mind conditions specified above. and please make sure to give a plan only for the number of days specified.
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
