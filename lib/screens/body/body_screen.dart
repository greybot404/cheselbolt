import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_card.dart';

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
                    'Body Analysis',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Comprehensive assessment and optimization',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Tab Navigation
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: tabs.map((tab) {
                    final isActive = activeTab == tab['id'];
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onDataUpdate({'activeTab': tab['id']}),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            tab['label'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'LibreBaskerville',
                              color: isActive ? Colors.black : Colors.grey[600],
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
                      CustomCard(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Text(
                              '${activeTab.substring(0, 1).toUpperCase()}${activeTab.substring(1)} Score',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${mockAnalysis[activeTab]?['score'] ?? 0}',
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: (mockAnalysis[activeTab]?['score'] ?? 0) / 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Analysis Card
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${activeTab.substring(0, 1).toUpperCase()}${activeTab.substring(1)} Analysis',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              mockAnalysis[activeTab]?['critique'] ?? '',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Optimization Protocol Card
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Optimization Protocol',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
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
                                            color: Colors.grey[700],
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