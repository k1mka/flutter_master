import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_master/data/datasources/models/question_model.dart';
import 'package:flutter_master/data/datasources/remote/storage_service/firestore_service.dart';

class StorageServiceFirebaseImpl implements StorageServiceFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const _isCorrectField = 'is_correct';
  static const _questionsCollection = 'questions';

  @override
  Future<List<QuestionModel>> getQuestions() async {
    try {
      final snapshot = await _firestore.collection(_questionsCollection).get();
      return snapshot.docs
          .map((doc) => QuestionModel.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateQuestionStatus(String questionId, bool isCorrect) async {
    try {
      final docRef =
          _firestore.collection(_questionsCollection).doc(questionId);
      await docRef.update({_isCorrectField: isCorrect});
    } catch (e) {
      rethrow;
    }
  }
}
