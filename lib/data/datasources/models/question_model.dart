class QuestionModel {
  final String text;
  final bool? isCorrect;
  final String questionId;

  QuestionModel({
    required this.text,
    this.isCorrect,
    required this.questionId,
  });

  factory QuestionModel.fromFirestore(Map<String, dynamic> data, String id) {
    return QuestionModel(
      text: data['text'] as String,
      isCorrect: data['is_correct'] as bool?,
      questionId: id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'is_correct': isCorrect,
    };
  }
}
