import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import '../../features/home/domain/models/transaction.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collection = 'transactions';

  // Get all transactions
  Stream<List<Transaction>> getTransactions() {
    return _db
        .collection(_collection)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Transaction.fromMap(doc.data(), doc.id))
            .toList());
  }

  // Add a transaction
  Future<void> addTransaction(Transaction transaction) async {
    await _db.collection(_collection).add(transaction.toMap());
  }

  // Delete a transaction
  Future<void> deleteTransaction(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }
}
