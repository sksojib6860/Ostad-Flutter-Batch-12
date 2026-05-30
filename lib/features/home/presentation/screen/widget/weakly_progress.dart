import 'package:flutter/material.dart';

class WeeklyProgressSection extends StatelessWidget {
  const WeeklyProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Progress',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Budget Spent', style: TextStyle(color: Colors.white70)),
                  Text(
                    '65%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: 0.65,
                backgroundColor: Colors.white10,
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(10),
                minHeight: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
