import 'package:flutter/material.dart';
import '../../domain/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      title: 'Salary',
      category: 'Work',
      amount: 5000.00,
      date: DateTime.now(),
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery',
      category: 'Food',
      amount: 150.00,
      date: DateTime.now().subtract(const Duration(days: 1)),
      isIncome: false,
    ),
    Transaction(
      title: 'Rent',
      category: 'Housing',
      amount: 1200.00,
      date: DateTime.now().subtract(const Duration(days: 2)),
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance',
      category: 'Work',
      amount: 800.00,
      date: DateTime.now().subtract(const Duration(days: 3)),
      isIncome: true,
    ),
    Transaction(
      title: 'Internet Bill',
      category: 'Bills',
      amount: 60.00,
      date: DateTime.now().subtract(const Duration(days: 4)),
      isIncome: false,
    ),
    Transaction(
      title: 'Dinner',
      category: 'Food',
      amount: 45.00,
      date: DateTime.now().subtract(const Duration(days: 5)),
      isIncome: false,
    ),
  ];

  List<Transaction> get transactions => [..._transactions];

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

  void deleteTransaction(int index) {
    _transactions.removeAt(index);
    notifyListeners();
  }
}
