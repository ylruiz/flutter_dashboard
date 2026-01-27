import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../navigation/models/navigation_config.dart';
import '../navigation/widgets/navigation_item.dart';

class DashboardDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final List<NavigationItemConfig>? items;

  const DashboardDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    final navigationItems = items ?? NavigationItemConfig.allItems;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  PhosphorIconsFill.userCircle,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  userEmail,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ...navigationItems.map((config) => NavigationItem(config: config)),
        ],
      ),
    );
  }
}
