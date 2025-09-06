import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_master/core/constants.dart';
import 'package:flutter_master/data/models/question_model.dart';
import 'package:flutter_master/data/datasources/storage_service.dart';

class StorageServiceFirebaseImpl implements StorageService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<QuestionModel>> getQuestions() async {
    // TODO(Benik): we need try branch here, or we can do it only for domain?
    try {
      final snapshot = await _fireStore.collection(Constants.questionsCollection).get();
      return snapshot.docs
          .map((doc) => QuestionModel.fromJson({
                Constants.questionIdField: doc.id,
                ...doc.data(),
              }))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateQuestionStatus(String questionId, bool isCorrect) async {
    // TODO(Benik): we need try branch here, or we can do it only for domain?
    try {
      final docRef = _fireStore.collection(Constants.questionsCollection).doc(questionId);
      await docRef.update({Constants.isCorrectField: isCorrect});
    } catch (e) {
      rethrow;
    }
  }
}
