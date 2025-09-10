import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Cores para legenda
    final tempColor = const Color(0xFF1565C0); // Azul escuro
    final umidColor = const Color(0xFF90CAF9); // Azul claro

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Topo: ícone e título
              Row(
                children: [
                  Icon(Icons.cloud, color: Colors.teal, size: 32),
                  const SizedBox(width: 8),
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Metas históricas (médias por mês, acompanhado diariamente)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 18),
              // Gráfico de linhas mockado (duas linhas)
              SizedBox(
                height: 160,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            if (value == 25 || value == 26 || value == 27 || value == 28 || value == 29) {
                              return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                            if (value >= 0 && value < months.length) {
                              return Text(months[value.toInt()], style: const TextStyle(fontSize: 12));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 5,
                    minY: 25,
                    maxY: 29,
                    lineBarsData: [
                      // Temperatura (azul escuro)
                      LineChartBarData(
                        isCurved: true,
                        color: tempColor,
                        barWidth: 3,
                        dotData: FlDotData(show: false),
                        spots: [
                          FlSpot(0, 26.5),
                          FlSpot(1, 27.2),
                          FlSpot(2, 28.1),
                          FlSpot(3, 26.7),
                          FlSpot(4, 27.5),
                          FlSpot(5, 26.8),
                        ],
                      ),
                      // Umidade (azul claro)
                      LineChartBarData(
                        isCurved: true,
                        color: umidColor,
                        barWidth: 3,
                        dotData: FlDotData(show: false),
                        spots: [
                          FlSpot(0, 25.8),
                          FlSpot(1, 26.1),
                          FlSpot(2, 27.0),
                          FlSpot(3, 26.0),
                          FlSpot(4, 26.7),
                          FlSpot(5, 26.2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Legenda das linhas
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 4,
                        color: tempColor,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Temperatura',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 4,
                        color: umidColor,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Umidade',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Bar chart título
              Row(
                children: [
                  const Icon(Icons.bar_chart, color: Colors.black87),
                  const SizedBox(width: 6),
                  const Text(
                    'Bar chart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Spacer(),
                  Icon(Icons.show_chart, color: Colors.teal[400], size: 18),
                  const SizedBox(width: 4),
                  const Text(
                    '+86%',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Temperatura, umidade',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              // Gráfico de barras mockado
              SizedBox(
                height: 90,
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                    barGroups: [
                      makeBarGroup(0, 8, 5, tempColor, umidColor),
                      makeBarGroup(1, 7, 4, tempColor, umidColor),
                      makeBarGroup(2, 7, 6, tempColor, umidColor),
                      makeBarGroup(3, 5, 3, tempColor, umidColor),
                      makeBarGroup(4, 4, 2, tempColor, umidColor),
                      makeBarGroup(5, 3, 2, tempColor, umidColor),
                      makeBarGroup(6, 2, 1, tempColor, umidColor),
                      makeBarGroup(7, 2, 1, tempColor, umidColor),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Legenda das barras
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 10,
                        color: tempColor,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Temperatura',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 10,
                        color: umidColor,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Umidade',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeBarGroup(int x, double y1, double y2, Color tempColor, Color umidColor) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: tempColor,
          width: 14,
          borderRadius: BorderRadius.circular(4),
          rodStackItems: [
            BarChartRodStackItem(0, y2, umidColor),
            BarChartRodStackItem(y2, y1, tempColor),
          ],
        ),
      ],
    );
  }
}