import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FrequencyChart extends StatelessWidget {
  const FrequencyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Gain (dB)',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                child: LineChart(
                  LineChartData(
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
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}k',
                              style: const TextStyle(fontSize: 9),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 35,
                          interval: 10,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}',
                              style: const TextStyle(fontSize: 9),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 40),
                          FlSpot(1, 38),
                          FlSpot(2, 35),
                          FlSpot(3, 28),
                          FlSpot(4, 20),
                          FlSpot(5, 10),
                          FlSpot(6, 0),
                          FlSpot(7, -10),
                          FlSpot(8, -20),
                          FlSpot(9, -30),
                          FlSpot(10, -40),
                        ],
                        isCurved: true,
                        color: Colors.green.shade700,
                        barWidth: 2,
                      ),
                    ],
                    minX: 0,
                    maxX: 10,
                    minY: -50,
                    maxY: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Phase (°)',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      drawHorizontalLine: true,
                      verticalInterval: 1,
                      horizontalInterval: 45,
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
                              '${value.toInt()}k',
                              style: const TextStyle(fontSize: 9),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 35,
                          interval: 45,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}°',
                              style: const TextStyle(fontSize: 9),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 0),
                          FlSpot(1, -15),
                          FlSpot(2, -35),
                          FlSpot(3, -60),
                          FlSpot(4, -85),
                          FlSpot(5, -105),
                          FlSpot(6, -120),
                          FlSpot(7, -135),
                          FlSpot(8, -150),
                          FlSpot(9, -165),
                          FlSpot(10, -180),
                        ],
                        isCurved: true,
                        color: Colors.orange.shade700,
                        barWidth: 2,
                      ),
                    ],
                    minX: 0,
                    maxX: 10,
                    minY: -180,
                    maxY: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
