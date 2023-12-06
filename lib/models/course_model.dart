import 'package:financial_assistant/models/test_model.dart';

class CourseModel {
  String imgUrl;
  String courseName;
  String courseDescription;
  final int progress;
  TestModel test;

  CourseModel( {
    this.imgUrl = '',
    required this.courseName,
    required this.courseDescription,
    required this.test,
    this.progress = 0,
  });

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
      'courseDescription': courseDescription,
      'test': test.toJson(),
    };
  }

  // Метод для десериализации из JSON
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseName: json['courseName'],
      courseDescription: json['courseDescription'],
      test: TestModel.fromJson(json['test']),
    );
  }
}