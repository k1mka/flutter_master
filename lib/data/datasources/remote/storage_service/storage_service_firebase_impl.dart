import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_master/data/datasources/models/question_model.dart';
import 'package:flutter_master/data/datasources/storage_service.dart';

class StorageServiceFirebaseImpl implements StorageService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static const _isCorrectField = 'is_correct';
  static const _questionsCollection = 'questions';

  @override
  Future<List<QuestionModel>> getQuestions() async {
    // TODO(Benik): we need try branche here, or we can do it only for domain?
    try {
      final snapshot = await _fireStore.collection(_questionsCollection).get();
      return snapshot.docs.map((doc) => QuestionModel.fromFirestore(doc.data(), doc.id)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateQuestionStatus(String questionId, bool isCorrect) async {
    // TODO(Benik): we need try branche here, or we can do it only for domain?
    try {
      final docRef = _fireStore.collection(_questionsCollection).doc(questionId);
      await docRef.update({_isCorrectField: isCorrect});
    } catch (e) {
      rethrow;
    }
  }
}
