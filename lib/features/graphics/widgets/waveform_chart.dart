import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WaveformChart extends StatelessWidget {
  const WaveformChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: true,
          verticalInterval: 1,
          horizontalInterval: 1,
          getDrawingVerticalLine: (value) =>
              FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}ms',
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}V',
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.shade400, width: 0.5),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: _generateWaveformSpots(),
            isCurved: false,
            color: Colors.blue.shade700,
            barWidth: 1.5,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.withValues(alpha: 0.3),
                  Colors.blue.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
          LineChartBarData(
            spots: _generateWaveformSpots(offset: 0.3),
            isCurved: false,
            color: Colors.red.shade600,
            barWidth: 1.5,
          ),
        ],
        minX: 0,
        maxX: 10,
        minY: -5,
        maxY: 5,
      ),
    );
  }

  List<FlSpot> _generateWaveformSpots({double offset = 0}) {
    final spots = <FlSpot>[];
    for (double i = 0; i <= 10; i += 0.1) {
      final y = 3 * math.sin(i + offset);
      spots.add(FlSpot(i, y));
    }
    return spots;
  }
}
