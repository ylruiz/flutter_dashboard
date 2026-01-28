import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../config/app_constants.dart';
import 'custom_card.dart';

class ExpandedContainer extends HookConsumerWidget {
  const ExpandedContainer({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isContentExpanded = useState<bool>(true);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: isContentExpanded.value ? 400 : 80,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppBorderRadius.mediumRadius,
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    isContentExpanded.value = !isContentExpanded.value;
                  },
                  icon: isContentExpanded.value
                      ? Icon(PhosphorIconsRegular.caretUp)
                      : Icon(PhosphorIconsRegular.caretDown),
                ),
              ],
            ),
            if (isContentExpanded.value) ...[
              const SizedBox(height: 8),
              Flexible(child: child),
            ],
          ],
        ),
      ),
    );
  }
}
