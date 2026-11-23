import 'package:chattrooo/common/theme/custom_theme_extension.dart';
import 'package:chattrooo/components/appbar/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// Pantalla que visualiza las estadísticas de uso de la aplicación.
///
/// Presenta un gráfico de barras interactivo utilizando el paquete [fl_chart]
/// para representar métricas de actividad de forma visual.
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  /// Estructura principal de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar personalizado
      appBar: SimpleAppBar(
        title: "Usage statistics",
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AspectRatio(
            aspectRatio: 1.5,
            // Gráfico de barras
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 3,
                        color: context.theme.graphbarsColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 5,
                        color: context.theme.graphbarsColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 9,
                        color: context.theme.graphbarsColor,
                      ),
                    ],
                  ),
                ],

                // Configuración de los títulos y etiquetas en los cuatro ejes del gráfico.
                titlesData: FlTitlesData(
                  show: true,

                  // Eje inferior (X)
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: context.theme.graphBarAxisColor,
                          ),
                        );
                      },
                    ),
                  ),

                  // Eje superior (X)
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: context.theme.graphBarAxisColor,
                          ),
                        );
                      },
                    ),
                  ),

                  // Eje izquierdo (Y)
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: context.theme.graphBarAxisColor,
                          ),
                        );
                      },
                    ),
                  ),

                  // Eje derecho (Y)
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: context.theme.graphBarAxisColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
