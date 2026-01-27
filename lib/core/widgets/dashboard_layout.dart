import 'package:flutter/material.dart';

import '../../../core/config/responsive.dart';
import '../../../core/navigation/widgets/sidebar_navigation.dart';
import '../../../core/navigation/widgets/bottom_navigation.dart';
import 'dashboard_app_bar.dart';
import 'dashboard_drawer.dart';

class ResponsiveDashboardLayout extends StatelessWidget {
  const ResponsiveDashboardLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return _DesktopDashboardLayout(body: body);
    }

    if (Responsive.isTablet(context)) {
      return _TabletDashboardLayout(body: body);
    }

    return _MobileDashboardLayout(body: body);
  }
}

class _DesktopDashboardLayout extends StatelessWidget {
  const _DesktopDashboardLayout({required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: SidebarNavigation(
              userName: 'John Doe',
              userEmail: 'john.doe@example.com',
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(padding: const EdgeInsets.all(16.0), child: body),
          ),
        ],
      ),
    );
  }
}

class _TabletDashboardLayout extends StatelessWidget {
  const _TabletDashboardLayout({required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      drawer: const DashboardDrawer(
        userName: 'John Doe',
        userEmail: 'john.doe@example.com',
      ),
      body: body,
    );
  }
}

class _MobileDashboardLayout extends StatelessWidget {
  const _MobileDashboardLayout({required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      drawer: const DashboardDrawer(
        userName: 'John Doe',
        userEmail: 'john.doe@example.com',
      ),
      endDrawer: const Placeholder(),
      body: body,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
