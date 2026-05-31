import 'package:expene_tracker_app/features/home/presentation/screen/widget/add_transaction_fab.dart';
import 'package:expene_tracker_app/features/home/presentation/screen/widget/header.dart';
import 'package:expene_tracker_app/features/home/presentation/screen/widget/summary_card.dart';
import 'package:expene_tracker_app/features/home/presentation/screen/widget/transaction_and_all.dart';
import 'package:expene_tracker_app/features/home/presentation/screen/widget/transaction_list_section.dart';
import 'package:expene_tracker_app/features/home/presentation/screen/widget/weakly_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/transaction_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<TransactionProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // FIXED SECTION: Header
                  const HeaderSection(),
                  const SizedBox(height: 30),
                  // FIXED SECTION: Summary Card
                  const SummaryCard(),
                  const SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Weekly Progress Section
                          const WeeklyProgressSection(),
                          const SizedBox(height: 30),
                          // Transaction Heading
                          TransactionAndSeeAll(),
                          const SizedBox(height: 10),
                          // Transaction List
                          const TransactionListSection(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),

      floatingActionButton: const AddTransactionFab(),
    );
  }
}
