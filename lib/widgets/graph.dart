import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StyledMarksGraph extends StatelessWidget {
  final List<FlSpot> dataPoints;

  const StyledMarksGraph({required this.dataPoints, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          minX: 1,
          maxX: dataPoints.length.toDouble(),
          minY: 0,
          maxY: 100,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (_) => FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            ),
            getDrawingVerticalLine: (_) => FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, _) => Text(
                  'Day ${value.toInt()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, _) => Text(
                  '${value.toInt()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent.withOpacity(0.3),
                    Colors.purpleAccent.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                  radius: 4,
                  color: Colors.deepPurple,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
