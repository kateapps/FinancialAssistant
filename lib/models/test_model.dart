class TestModel {
  String testName;
  List<QuestionModel> questions;

  TestModel({
    required this.testName,
    required this.questions,
  });

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() {
    return {
      'testName': testName,
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }

  // Метод для десериализации из JSON
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      testName: json['testName'],
      questions: (json['questions'] as List).map((question) => QuestionModel.fromJson(question)).toList(),
    );
  }
}

class QuestionModel {
  String questionText;
  List<String> options;
  int correctOptionIndex;

  QuestionModel({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() {
    return {
      'questionText': questionText,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
    };
  }

  // Метод для десериализации из JSON
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionText: json['questionText'],
      options: List<String>.from(json['options']),
      correctOptionIndex: json['correctOptionIndex'],
    );
  }
}