import 'package:flutter/material.dart';

import '../../../core/config/app_constants.dart';
import '../../../core/config/responsive.dart';
import '../../tables/widgets/component_specs_table.dart';
import '../../tables/widgets/sensor_table.dart';
import 'graph_container.dart';

class ResponsiveDashboardContent extends StatelessWidget {
  const ResponsiveDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return const _DesktopDashboardContent();
    }

    return const _MobileDashboardContent();
  }
}

class _DesktopDashboardContent extends StatelessWidget {
  const _DesktopDashboardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppSpacing.lg,
      children: const [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.lg,
            children: [GraphContainer(), SensorTable()],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.lg,
            children: [ComponentSpecsTable()],
          ),
        ),
      ],
    );
  }
}

class _MobileDashboardContent extends StatelessWidget {
  const _MobileDashboardContent();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return GraphContainer();
          case 1:
            return SensorTable();
          case 2:
            return ComponentSpecsTable();

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
