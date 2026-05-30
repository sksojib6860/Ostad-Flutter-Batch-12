import 'package:expene_tracker_app/features/home/presentation/screen/widget/transaction_iteam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/transaction_provider.dart';

class TransactionListSection extends StatelessWidget {
  const TransactionListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    return ListView.builder(
      shrinkWrap: true, // Fix for SingleChildScrollView
      physics:
          const NeverScrollableScrollPhysics(), // Fix for SingleChildScrollView
      itemCount: provider.transactions.length,
      itemBuilder: (context, index) {
        final tx = provider.transactions[index];
        return TransactionItem(tx: tx, index: index);
      },
    );
  }
}
