import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/transaction_provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 20,
      shadowColor: Colors.black.withValues(alpha: 0.5),
      child: Container(
        padding: const EdgeInsets.all(25),
        height: 220,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF6366f1), Color(0xFFa855f7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${provider.totalBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBalanceInfo(
                  'Income',
                  '\$${provider.totalIncome.toStringAsFixed(0)}',
                  Icons.arrow_downward_rounded,
                  Colors.greenAccent,
                ),
                _buildBalanceInfo(
                  'Expenses',
                  '\$${provider.totalExpenses.toStringAsFixed(0)}',
                  Icons.arrow_upward_rounded,
                  Colors.redAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceInfo(
    String label,
    String amount,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Text(
              amount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
