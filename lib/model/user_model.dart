class UserInputModel {
  String gender;
  int height;
  double weight;
  int age;
  String goal;
  List<String> bodyPartsToFocus;
  bool fitnessExperience;
  String workoutFrequency;
  List<String> equipmentList;

  UserInputModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.goal,
    required this.bodyPartsToFocus,
    required this.fitnessExperience,
    required this.workoutFrequency,
    required this.equipmentList,
  });
}
