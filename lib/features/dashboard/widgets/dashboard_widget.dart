import 'package:flutter/material.dart';

import '../../../core/config/responsive.dart';
import '../../../core/navigation/widgets/sidebar_navigation.dart';
import 'dashboard_app_bar.dart';
import '../../../core/navigation/widgets/bottom_navigation.dart';
import 'dashboard_drawer.dart';
import 'dashboard_grid.dart';

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return const DesktopDashboard();
    }

    if (Responsive.isTablet(context)) {
      return const TabletDashboard();
    }

    return const MobileDashboard();
  }
}

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: SidebarNavigation(
              userName: 'John Doe',
              userEmail: 'john.doe@example.com',
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: const DashboardGrid(),
            ),
          ),
        ],
      ),
    );
  }
}

class TabletDashboard extends StatelessWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      drawer: const DashboardDrawer(
        userName: 'John Doe',
        userEmail: 'john.doe@example.com',
      ),
      body: const DashboardGrid(),
    );
  }
}

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      drawer: const DashboardDrawer(
        userName: 'John Doe',
        userEmail: 'john.doe@example.com',
      ),
      endDrawer: const Placeholder(),
      body: const DashboardGrid(),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
