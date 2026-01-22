import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/config/responsive.dart';
import '../../../core/navigation/widgets/sidebar_navigation.dart';
import 'dashboard_app_bar.dart';
import 'dashboard_bottom_navigation.dart';
import 'dashboard_drawer.dart';
import 'details_panel.dart';

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
          const Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Dasboard content goes here'),
            ),
          ),
          Expanded(flex: 3, child: DetailsPanel()),
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
      body: Row(
        children: [
          const Expanded(
            flex: 6,
            child: AutoRouter(key: ValueKey('dashboard_router')),
          ),
          if (MediaQuery.of(context).size.width >= 950)
            const Expanded(flex: 3, child: DetailsPanel()),
        ],
      ),
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
      body: const AutoRouter(key: ValueKey('dashboard_router')),
      bottomNavigationBar: const DashboardBottomNavigation(),
    );
  }
}
