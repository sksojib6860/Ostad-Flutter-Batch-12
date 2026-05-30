import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/presentation/provider/transaction_provider.dart';
import 'features/home/presentation/screen/home_page.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(home: const MyHomePage()),
    );
  }
}
