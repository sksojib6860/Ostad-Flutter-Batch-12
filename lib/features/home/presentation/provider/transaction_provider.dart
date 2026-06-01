import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/models/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';

class TransactionProvider with ChangeNotifier {
  final TransactionRepository _repository;
  List<Transaction> _transactions = [];
  StreamSubscription<List<Transaction>>? _transactionSubscription;

  TransactionProvider(this._repository) {
    _initTransactions();
  }

  void _initTransactions() {
    _transactionSubscription?.cancel();
    _transactionSubscription = _repository.getTransactions().listen((transactions) {
      _transactions = transactions;
      notifyListeners();
    });
  }

  List<Transaction> get transactions => _transactions;

  double get totalBalance {
    double total = 0;
    for (var tx in _transactions) {
      if (tx.isIncome) {
        total += tx.amount;
      } else {
        total -= tx.amount;
      }
    }
    return total;
  }

  double get totalIncome {
    double total = 0;
    for (var tx in _transactions) {
      if (tx.isIncome) {
        total += tx.amount;
      }
    }
    return total;
  }

  double get totalExpenses {
    double total = 0;
    for (var tx in _transactions) {
      if (!tx.isIncome) {
        total += tx.amount;
      }
    }
    return total;
  }

  Future<void> deleteTransaction(String? id) async {
    if (id != null) {
      await _repository.deleteTransaction(id);
    }
  }

  Future<void> addTransaction(Transaction transaction) async {
    await _repository.addTransaction(transaction);
  }

  @override
  void dispose() {
    _transactionSubscription?.cancel();
    super.dispose();
  }
}
