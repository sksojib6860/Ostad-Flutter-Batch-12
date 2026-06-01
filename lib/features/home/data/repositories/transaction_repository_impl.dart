import '../../../../core/services/firestore_service.dart';
import '../../domain/models/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final FirestoreService _firestoreService;

  TransactionRepositoryImpl(this._firestoreService);

  @override
  Stream<List<Transaction>> getTransactions() {
    return _firestoreService.getTransactions();
  }

  @override
  Future<void> addTransaction(Transaction transaction) {
    return _firestoreService.addTransaction(transaction);
  }

  @override
  Future<void> deleteTransaction(String id) {
    return _firestoreService.deleteTransaction(id);
  }
}
