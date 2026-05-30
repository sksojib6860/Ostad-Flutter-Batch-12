import 'package:flutter/material.dart';

class TransactionAndSeeAll extends StatelessWidget {
  const TransactionAndSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}
