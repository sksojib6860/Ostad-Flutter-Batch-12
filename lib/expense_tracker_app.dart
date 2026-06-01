import 'package:expene_tracker_app/core/services/firestore_service.dart';
import 'package:expene_tracker_app/features/home/data/repositories/transaction_repository_impl.dart';
import 'package:expene_tracker_app/features/home/domain/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/presentation/provider/transaction_provider.dart';
import 'features/home/presentation/screen/home_page.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FirestoreService()),
        ProxyProvider<FirestoreService, TransactionRepository>(
          update: (context, firestoreService, previous) =>
              TransactionRepositoryImpl(firestoreService),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(
            Provider.of<TransactionRepository>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MyHomePage(),
      ),
    );
  }
}
