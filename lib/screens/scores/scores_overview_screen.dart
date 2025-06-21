import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/glass_container.dart';
import '../../widgets/animated_score_meter.dart';

class ScoresOverviewScreen extends StatelessWidget {
  const ScoresOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: GlassContainer(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Scores Overview',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                  ],
                ),
              ),
              
              // Radar Chart
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      GlassContainer(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              'Overall Performance',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'LibreBaskerville',
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 300,
                              child: RadarChart(
                                RadarChartData(
                                  radarBackgroundColor: Colors.transparent,
                                  radarBorderData: const BorderSide(
                                    color: Colors.white24,
                                    width: 2,
                                  ),
                                  tickBorderData: const BorderSide(
                                    color: Colors.white12,
                                    width: 1,
                                  ),
                                  gridBorderData: const BorderSide(
                                    color: Colors.white12,
                                    width: 1,
                                  ),
                                  tickCount: 5,
                                  ticksTextStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 10,
                                  ),
                                  radarShape: RadarShape.polygon,
                                  dataSets: [
                                    RadarDataSet(
                                      fillColor: const Color(0xFF6366F1).withOpacity(0.3),
                                      borderColor: const Color(0xFF6366F1),
                                      borderWidth: 2,
                                      dataEntries: [
                                        const RadarEntry(value: 78), // Fitness
                                        const RadarEntry(value: 82), // Fashion
                                        const RadarEntry(value: 75), // Body
                                        const RadarEntry(value: 72), // Presence
                                        const RadarEntry(value: 85), // Nutrition
                                      ],
                                    ),
                                  ],
                                  getTitle: (index, angle) {
                                    const titles = ['Fitness', 'Fashion', 'Body', 'Presence', 'Nutrition'];
                                    return RadarChartTitle(
                                      text: titles[index],
                                      angle: angle,
                                      positionPercentageOffset: 0.1,
                                    );
                                  },
                                  titleTextStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 12,
                                    fontFamily: 'LibreBaskerville',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Individual Scores
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          GlassContainer(
                            padding: const EdgeInsets.all(20),
                            child: AnimatedScoreMeter(
                              score: 78,
                              title: 'Fitness',
                              primaryColor: const Color(0xFF10B981),
                              secondaryColor: const Color(0xFF059669),
                              size: 100,
                            ),
                          ),
                          GlassContainer(
                            padding: const EdgeInsets.all(20),
                            child: AnimatedScoreMeter(
                              score: 82,
                              title: 'Fashion',
                              primaryColor: const Color(0xFFF59E0B),
                              secondaryColor: const Color(0xFFD97706),
                              size: 100,
                            ),
                          ),
                          GlassContainer(
                            padding: const EdgeInsets.all(20),
                            child: AnimatedScoreMeter(
                              score: 75,
                              title: 'Body',
                              primaryColor: const Color(0xFFEF4444),
                              secondaryColor: const Color(0xFFDC2626),
                              size: 100,
                            ),
                          ),
                          GlassContainer(
                            padding: const EdgeInsets.all(20),
                            child: AnimatedScoreMeter(
                              score: 72,
                              title: 'Presence',
                              primaryColor: const Color(0xFF8B5CF6),
                              secondaryColor: const Color(0xFF7C3AED),
                              size: 100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}