import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../models/navigation_config.dart';
import 'navigation_item.dart';

class SidebarNavigation extends StatelessWidget {
  final String userName;
  final String userEmail;
  final List<NavigationItemConfig>? items;

  const SidebarNavigation({
    super.key,
    required this.userName,
    required this.userEmail,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    final navigationItems = items ?? NavigationItemConfig.allItems;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            children: [
              Icon(
                PhosphorIconsFill.userCircle,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                userName,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                userEmail,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ...navigationItems.map((config) => NavigationItem(config: config)),
        ],
      ),
    );
  }
}
