import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum NavigationItemType { dashboard, graphics, reports, tables }

class NavigationItemConfig {
  final NavigationItemType type;
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  bool isSelected;

  NavigationItemConfig({
    required this.type,
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.isSelected = false,
  });

  IconData get effectiveIcon => isSelected ? (selectedIcon ?? icon) : icon;

  static final List<NavigationItemConfig> allItems = [
    NavigationItemConfig(
      type: NavigationItemType.dashboard,
      label: 'Home',
      icon: PhosphorIconsRegular.house,
      selectedIcon: PhosphorIconsFill.house,
    ),
    NavigationItemConfig(
      type: NavigationItemType.graphics,
      label: 'Graphics',
      icon: PhosphorIconsRegular.presentationChart,
      selectedIcon: PhosphorIconsFill.presentationChart,
    ),
    NavigationItemConfig(
      type: NavigationItemType.reports,
      label: 'Reports',
      icon: PhosphorIconsRegular.fileText,
      selectedIcon: PhosphorIconsFill.fileText,
    ),
    NavigationItemConfig(
      type: NavigationItemType.tables,
      label: 'Tables',
      icon: PhosphorIconsRegular.table,
      selectedIcon: PhosphorIconsFill.table,
    ),
  ];

  static NavigationItemConfig? fromRouteName(String routeName) {
    switch (routeName) {
      case 'DashboardRoute':
        return allItems[0];
      case 'GraphicsRoute':
        return allItems[1];
      case 'ReportsRoute':
        return allItems[2];
      case 'TablesRoute':
        return allItems[3];
      default:
        return allItems[0];
    }
  }
}
