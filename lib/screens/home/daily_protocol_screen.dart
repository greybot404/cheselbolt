import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';

class DailyProtocolScreen extends StatelessWidget {
  final List<Mission> missions;
  final Function(String) onMarkComplete;

  const DailyProtocolScreen({
    super.key,
    required this.missions,
    required this.onMarkComplete,
  });

  @override
  Widget build(BuildContext context) {
    final todaysMissions = missions.where((mission) => !mission.completed).toList();
    final completedMissions = missions.where((mission) => mission.completed).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Header
              Column(
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
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Active Missions
                      if (todaysMissions.isNotEmpty) ...[
                        Text(
                          'Active Missions',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: 'LibreBaskerville',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...todaysMissions.map((mission) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CustomCard(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mission.module.toUpperCase(),
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[500],
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  mission.title,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  mission.description,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                CustomButton(
                                  text: 'Mark as Complete',
                                  onPressed: () => onMarkComplete(mission.id),
                                  fullWidth: true,
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                      
                      // Completed Missions
                      if (completedMissions.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text(
                          'Completed Today',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: 'LibreBaskerville',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...completedMissions.map((mission) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CustomCard(
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mission.module.toUpperCase(),
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                          fontFamily: 'LibreBaskerville',
                                          color: Colors.grey[500],
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        mission.title,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontFamily: 'LibreBaskerville',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
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
                        CustomCard(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                size: 48,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'All Clear',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontFamily: 'LibreBaskerville',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'No missions for today. Check back tomorrow for new protocols.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontFamily: 'LibreBaskerville',
                                  color: Colors.grey[600],
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
            ],
          ),
        ),
      ),
    );
  }
}