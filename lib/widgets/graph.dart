import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScorePoint {
  final String label; // e.g., "Test 1" or "12 Sep"
  final double score; // e.g., 18.0 out of 20
  const ScorePoint({required this.label, required this.score});
}

class QuizScoresLineChart extends StatelessWidget {
  final List<ScorePoint> points;

  // Optional customization
  final double minY;        // e.g., 0
  final double maxY;        // e.g., 100
  final Color lineColor;
  final Color fillColor;
  final bool showDots;
  final bool showArea;
  final EdgeInsets padding;

  const QuizScoresLineChart({
    super.key,
    required this.points,
    this.minY = 0,
    this.maxY = 100,
    this.lineColor = const Color(0xFF4F46E5),
    this.fillColor = const Color(0x334F46E5),
    this.showDots = true,
    this.showArea = true,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    if (points.isEmpty) {
      return const _EmptyState();
    }

    // Map points to FlSpots (x = index, y = score)
    final spots = <FlSpot>[];
    for (int i = 0; i < points.length; i++) {
      spots.add(FlSpot(i.toDouble(), points[i].score));
    }

    return Padding(
      padding: padding,
      child: AspectRatio(
        aspectRatio: 1.7,
        child: LineChart(
          LineChartData(
            minY: minY,
            maxY: maxY,
            minX: 0,
            maxX: (points.length - 1).toDouble(),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: _niceStep(minY, maxY),
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
              ),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  interval: _niceStep(minY, maxY),
                  getTitlesWidget: (value, meta) => Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final idx = value.toInt();
                    if (idx < 0 || idx >= points.length) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        points[idx].label,
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) => touchedSpots.map((t) {
                  final idx = t.spotIndex;
                  final p = points[idx];
                  return LineTooltipItem(
                    '${p.label}\nScore: ${p.score.toStringAsFixed(0)}',
                    const TextStyle(color: Colors.white, fontSize: 12),
                  );
                }).toList(),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey.withOpacity(0.25)),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                barWidth: 3,
                color: lineColor,
                dotData: FlDotData(show: showDots),
                belowBarData: BarAreaData(
                  show: showArea,
                  gradient: LinearGradient(
                    colors: [fillColor, fillColor.withOpacity(0.05)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _niceStep(double min, double max) {
    final range = (max - min).abs();
    if (range <= 10) return 2;
    if (range <= 20) return 5;
    if (range <= 50) return 10;
    if (range <= 100) return 20;
    return range / 5;
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.25)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'No scores yet',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
