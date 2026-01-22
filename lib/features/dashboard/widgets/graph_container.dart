import 'package:flutter/material.dart';
import '../../../core/widgets/custom_card.dart';
import '../../graphics/widgets/waveform_chart.dart';
import '../../graphics/widgets/frequency_chart.dart';
import '../../graphics/widgets/power_chart.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Graphics Overview',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: WaveformChart()),
          Expanded(child: FrequencyChart()),
          Expanded(child: PowerChart()),
        ],
      ),
    );
  }
}
