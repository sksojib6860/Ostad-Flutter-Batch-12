import '../../domain/models/transaction.dart';

abstract class TransactionRepository {
  Stream<List<Transaction>> getTransactions();
  Future<void> addTransaction(Transaction transaction);
  Future<void> deleteTransaction(String id);
}
