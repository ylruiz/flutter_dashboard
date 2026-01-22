import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/navigation_config.dart';
import '../providers/navigation_provider.dart';
import '../routing/paths.dart';

class BottomNavigation extends ConsumerWidget {
  final List<NavigationItemConfig>? items;

  const BottomNavigation({super.key, this.items});

  bool _pathMatchesItem(String path, NavigationItemConfig item) {
    switch (item.type) {
      case NavigationItemType.dashboard:
        return path == Paths.root || path == Paths.dashboard;
      case NavigationItemType.graphics:
        return path == Paths.graphics;
      case NavigationItemType.reports:
        return path == Paths.reports;
      case NavigationItemType.tables:
        return path == Paths.tables;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationItems = items ?? NavigationItemConfig.allItems;
    final currentPath = AutoRouter.of(context).currentPath;
    final currentConfig = navigationItems.firstWhere(
      (item) => _pathMatchesItem(currentPath, item),
      orElse: () => navigationItems[0],
    );
    final currentIndex = navigationItems.indexWhere(
      (item) => item.type == currentConfig.type,
    );
    final index = currentIndex >= 0 ? currentIndex : 0;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(
          context,
        ).colorScheme.onSurface.withValues(alpha: 0.6),
        currentIndex: index,
        onTap: (index) {
          final config = navigationItems[index];
          ref.read(navigationProvider.notifier).selectItem(config.type);
        },
        items: navigationItems.map((config) {
          final currentConfig = navigationItems.firstWhere(
            (item) => _pathMatchesItem(currentPath, item),
            orElse: () => navigationItems[0],
          );
          final isSelected = config.type == currentConfig.type;
          return BottomNavigationBarItem(
            icon: Icon(isSelected ? config.effectiveIcon : config.icon),
            label: config.label,
          );
        }).toList(),
      ),
    );
  }
}
