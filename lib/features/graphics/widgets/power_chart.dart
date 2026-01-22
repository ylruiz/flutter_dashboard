import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PowerChart extends StatelessWidget {
  const PowerChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: true,
          verticalInterval: 1,
          horizontalInterval: 10,
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
              getTitlesWidget: (value, meta) {
                const labels = ['12V', '5V', '3.3V', '24V'];
                if (value.toInt() >= 0 && value.toInt() < labels.length) {
                  return Text(
                    labels[value.toInt()],
                    style: const TextStyle(fontSize: 10),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 10,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}W',
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
        barGroups: [
          BarChartGroupData(x: 0, barRods: [makeBar(45, Colors.blue.shade700)]),
          BarChartGroupData(
            x: 1,
            barRods: [makeBar(25, Colors.green.shade600)],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [makeBar(8, Colors.orange.shade600)],
          ),
          BarChartGroupData(x: 3, barRods: [makeBar(120, Colors.red.shade700)]),
        ],
        maxY: 150,
      ),
    );
  }

  BarChartRodData makeBar(double y, Color color) {
    return BarChartRodData(
      toY: y,
      color: color,
      width: 40,
      borderRadius: BorderRadius.circular(4),
    );
  }
}
