import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_master/data/datasources/remote/storage_service/firestore_service.dart';

class StorageServiceFirebaseImpl implements StorageServiceFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getQuestions() async {
    try {
      final snapshot = await _firestore.collection('questions').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateQuestionByText(
      String questionText, Map<String, dynamic> data) async {
    try {
      final snapshot = await _firestore
          .collection('questions')
          .where('text', isEqualTo: questionText)
          .get();
      for (var doc in snapshot.docs) {
        await doc.reference.update(data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
