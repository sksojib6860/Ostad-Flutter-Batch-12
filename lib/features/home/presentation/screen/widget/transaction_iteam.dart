import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/transaction.dart';
import '../../provider/transaction_provider.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  final int index;
  const TransactionItem({super.key, required this.tx, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: tx.isIncome
                    ? Colors.green.withValues(alpha: 0.15)
                    : Colors.red.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                tx.isIncome
                    ? Icons.add_circle_outline
                    : Icons.remove_circle_outline,
                color: tx.isIncome ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    tx.category,
                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${tx.isIncome ? "+" : "-"}\$${tx.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: tx.isIncome ? Colors.green : Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${tx.date.day}/${tx.date.month}/${tx.date.year}',
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.white.withValues(alpha: 0.5),
                size: 20,
              ),
              onPressed: () {
                provider.deleteTransaction(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
