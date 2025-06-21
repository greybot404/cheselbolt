import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/user_model.dart';
import '../../widgets/glass_container.dart';
import '../../widgets/animated_score_meter.dart';

class EnhancedDailyProtocolScreen extends StatelessWidget {
  final List<Mission> missions;
  final Function(String) onMarkComplete;
  final VoidCallback onScanFood;
  final VoidCallback onViewScores;

  const EnhancedDailyProtocolScreen({
    super.key,
    required this.missions,
    required this.onMarkComplete,
    required this.onScanFood,
    required this.onViewScores,
  });

  @override
  Widget build(BuildContext context) {
    final todaysMissions = missions.where((mission) => !mission.completed).toList();
    final completedMissions = missions.where((mission) => mission.completed).toList();
    final completionRate = missions.isEmpty ? 0.0 : (completedMissions.length / missions.length) * 100;

    return Container(
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Scanner
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chesel',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Today\'s Protocol',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'LibreBaskerville',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  GlassContainer(
                    padding: const EdgeInsets.all(12),
                    child: IconButton(
                      onPressed: onScanFood,
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Score Overview
              GlassContainer(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Overall Score',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'LibreBaskerville',
                          ),
                        ),
                        GestureDetector(
                          onTap: onViewScores,
                          child: Icon(
                            Icons.analytics,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AnimatedScoreMeter(
                      score: 78,
                      title: 'Today',
                      primaryColor: const Color(0xFF6366F1),
                      secondaryColor: const Color(0xFF8B5CF6),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Goals and Progress
              Row(
                children: [
                  Expanded(
                    child: GlassContainer(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Goals Achieved',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: 'LibreBaskerville',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${completedMissions.length}/${missions.length}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'LibreBaskerville',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GlassContainer(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Weekly Growth',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: 'LibreBaskerville',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '+12%',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF10B981),
                                  fontFamily: 'LibreBaskerville',
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.trending_up,
                                color: const Color(0xFF10B981),
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // What to do today section
              Text(
                'What to do today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'LibreBaskerville',
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Active Missions
              if (todaysMissions.isNotEmpty) ...[
                ...todaysMissions.map((mission) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GlassContainer(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6366F1).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF6366F1).withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                mission.module.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF6366F1),
                                  letterSpacing: 1.2,
                                  fontFamily: 'LibreBaskerville',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          mission.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'LibreBaskerville',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mission.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                            height: 1.5,
                            fontFamily: 'LibreBaskerville',
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => onMarkComplete(mission.id),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6366F1),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Mark as Complete',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'LibreBaskerville',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
              
              // Completed Missions
              if (completedMissions.isNotEmpty) ...[
                const SizedBox(height: 24),
                Text(
                  'Completed Today',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.9),
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
                const SizedBox(height: 16),
                ...completedMissions.map((mission) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GlassContainer(
                    opacity: 0.05,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Color(0xFF10B981),
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mission.module.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.6),
                                  letterSpacing: 1.2,
                                  fontFamily: 'LibreBaskerville',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                mission.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.8),
                                  fontFamily: 'LibreBaskerville',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
              
              // Empty State
              if (todaysMissions.isEmpty && completedMissions.isEmpty)
                GlassContainer(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(
                        Icons.celebration,
                        size: 48,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'All Clear',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'LibreBaskerville',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No missions for today. Check back tomorrow for new protocols.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                          fontFamily: 'LibreBaskerville',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}