import 'package:flutter/material.dart';

class DetailsPanel extends StatelessWidget {
  const DetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Placeholder(fallbackHeight: 400, color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
