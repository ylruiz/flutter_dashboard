import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/navigation_config.dart';
import '../providers/navigation_provider.dart';
import '../routing/app_router.gr.dart';
import '../routing/paths.dart';

class NavigationItem extends ConsumerWidget {
  final NavigationItemConfig config;

  const NavigationItem({super.key, required this.config});

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
    final currentPath = AutoRouter.of(context).currentPath;
    final currentConfig = NavigationItemConfig.allItems.firstWhere(
      (item) => _pathMatchesItem(currentPath, item),
      orElse: () => NavigationItemConfig.allItems[0],
    );
    final isSelected = config.type == currentConfig.type;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;
    final onSurfaceVariantColor = Theme.of(
      context,
    ).colorScheme.onSurfaceVariant;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        border: isSelected
            ? Border(left: BorderSide(color: primaryColor, width: 4))
            : null,
        color: isSelected
            ? primaryColor.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: primaryColor.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ListTile(
        leading: Icon(
          isSelected ? config.effectiveIcon : config.icon,
          color: isSelected ? primaryColor : onSurfaceVariantColor,
          size: isSelected ? 24 : 22,
        ),
        title: Text(
          config.label,
          style: TextStyle(
            color: isSelected ? primaryColor : onSurfaceColor,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        onTap: () {
          ref.read(navigationProvider.notifier).selectItem(config.type);
          switch (config.type) {
            case NavigationItemType.dashboard:
              context.router.push(const DashboardRoute());
              break;
            case NavigationItemType.graphics:
              context.router.push(const GraphicsRoute());
              break;
            case NavigationItemType.reports:
              context.router.push(const ReportsRoute());
              break;
            case NavigationItemType.tables:
              context.router.push(const TablesRoute());
              break;
          }
        },
      ),
    );
  }
}
