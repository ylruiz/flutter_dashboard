import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key, required this.columns});

  final int columns;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Overview',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          Placeholder(fallbackHeight: 600, color: Colors.blueAccent),
        ],
      ),
    );
  }
}
