import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsRegular.bell),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(PhosphorIconsRegular.gear),
          onPressed: () {},
        ),
      ],
    );
  }
}
