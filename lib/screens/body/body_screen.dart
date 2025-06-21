import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../widgets/glass_container.dart';
import '../../widgets/animated_score_meter.dart';

class BodyScreen extends StatelessWidget {
  final User user;
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) onDataUpdate;

  const BodyScreen({
    super.key,
    required this.user,
    required this.data,
    required this.onDataUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final activeTab = data['activeTab'] ?? 'face';
    
    final tabs = [
      {'id': 'face', 'label': 'Face'},
      {'id': 'skin', 'label': 'Skin'},
      {'id': 'hair', 'label': 'Hair'},
      if (user.gender == 'male') {'id': 'beard', 'label': 'Beard'},
    ];

    final mockAnalysis = {
      'face': {
        'score': 78,
        'critique': 'Strong jawline with good symmetry. Consider subtle grooming adjustments.',
        'protocol': [
          'Maintain consistent skincare routine',
          'Consider professional eyebrow shaping',
          'Use SPF 30+ daily for protection',
        ],
      },
      'skin': {
        'score': 72,
        'critique': 'Generally healthy complexion. Some areas could benefit from targeted care.',
        'protocol': [
          'Increase hydration with hyaluronic acid',
          'Add vitamin C serum to morning routine',
          'Exfoliate 2-3 times per week',
        ],
      },
      'hair': {
        'score': 85,
        'critique': 'Excellent texture and style. Maintain current routine with minor adjustments.',
        'protocol': [
          'Schedule trim every 6-8 weeks',
          'Use quality styling products sparingly',
          'Consider scalp massage for health',
        ],
      },
      'beard': {
        'score': 80,
        'critique': 'Well-maintained beard with good coverage. Consider trimming for sharper lines.',
        'protocol': [
          'Trim edges for sharp definition',
          'Use beard oil for conditioning',
          'Shape neckline professionally',
        ],
      },
    };

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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Header
              Column(
                children: [
                  Text(
                    'Body Analysis',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Comprehensive assessment and optimization',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Tab Navigation
              GlassContainer(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: tabs.map((tab) {
                    final isActive = activeTab == tab['id'];
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onDataUpdate({'activeTab': tab['id']}),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isActive 
                                ? const Color(0xFF6366F1).withOpacity(0.3)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: isActive
                                ? Border.all(
                                    color: const Color(0xFF6366F1).withOpacity(0.5),
                                    width: 1,
                                  )
                                : null,
                          ),
                          child: Text(
                            tab['label'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'LibreBaskerville',
                              color: isActive 
                                  ? const Color(0xFF6366F1)
                                  : Colors.white.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              const SizedBox(height: 32),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Score Card
                      GlassContainer(
                        padding: const EdgeInsets.all(32),
                        child: AnimatedScoreMeter(
                          score: mockAnalysis[activeTab]?['score']?.toDouble() ?? 0.0,
                          title: '${activeTab.substring(0, 1).toUpperCase()}${activeTab.substring(1)} Score',
                          primaryColor: const Color(0xFF6366F1),
                          secondaryColor: const Color(0xFF8B5CF6),
                          size: 140,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Analysis Card
                      GlassContainer(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${activeTab.substring(0, 1).toUpperCase()}${activeTab.substring(1)} Analysis',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              mockAnalysis[activeTab]?['critique'] ?? '',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                color: Colors.white.withOpacity(0.8),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Optimization Protocol Card
                      GlassContainer(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Optimization Protocol',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (mockAnalysis[activeTab]?['protocol'] as List<String>? ?? [])
                                  .map((item) => Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          '• $item',
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            fontFamily: 'LibreBaskerville',
                                            color: Colors.white.withOpacity(0.8),
                                          ),
                                        ),
                                      ))
                                  .toList(),
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