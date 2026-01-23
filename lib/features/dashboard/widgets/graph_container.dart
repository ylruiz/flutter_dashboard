import 'package:flutter/material.dart';
import '../../../core/widgets/expanded_container.dart';
import '../../graphics/widgets/waveform_chart.dart';
import '../../graphics/widgets/frequency_chart.dart';
import '../../graphics/widgets/power_chart.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      title: 'Graphics Overview',
      child: Column(
        children: [
          Expanded(child: WaveformChart()),
          Expanded(child: FrequencyChart()),
          Expanded(child: PowerChart()),
        ],
      ),
    );
  }
}
