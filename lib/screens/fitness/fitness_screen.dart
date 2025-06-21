import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';

class FitnessScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) onDataUpdate;

  const FitnessScreen({
    super.key,
    required this.data,
    required this.onDataUpdate,
  });

  @override
  Widget build(BuildContext context) {
    if (data['physique'] == null) {
      return _buildInitialState(context);
    }

    if (data['goalType'] == null && data['goalImage'] == null) {
      return _buildGoalSelection(context);
    }

    return _buildResultsDashboard(context);
  }

  Widget _buildInitialState(BuildContext context) {
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
                    'Fitness Analysis',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Begin your transformation journey',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              CustomCard(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 32,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Upload Physique',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: 'LibreBaskerville',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'To begin, upload a clear, full-body physique photograph. Ensure lighting is consistent.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'LibreBaskerville',
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Upload Physique',
                      onPressed: () => onDataUpdate({'physique': 'uploaded'}),
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalSelection(BuildContext context) {
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
                    'Define Goal Vector',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Set your transformation target',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              Expanded(
                child: Column(
                  children: [
                    // Upload Goal Image
                    CustomCard(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            size: 32,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Upload Goal Image',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Upload a reference photo of your goal physique.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            text: 'Upload Goal Image',
                            onPressed: () => onDataUpdate({'goalImage': 'uploaded'}),
                            variant: ButtonVariant.outline,
                            fullWidth: true,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    Text(
                      'OR',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'LibreBaskerville',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Select Primary Objective
                    CustomCard(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.track_changes_outlined,
                            size: 32,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Select Primary Objective',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Choose your main fitness goal.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              CustomButton(
                                text: 'Build Muscle',
                                onPressed: () => onDataUpdate({'goalType': 'build-muscle'}),
                                variant: ButtonVariant.outline,
                                fullWidth: true,
                              ),
                              const SizedBox(height: 12),
                              CustomButton(
                                text: 'Lose Fat',
                                onPressed: () => onDataUpdate({'goalType': 'lose-fat'}),
                                variant: ButtonVariant.outline,
                                fullWidth: true,
                              ),
                              const SizedBox(height: 12),
                              CustomButton(
                                text: 'Improve Definition',
                                onPressed: () => onDataUpdate({'goalType': 'improve-definition'}),
                                variant: ButtonVariant.outline,
                                fullWidth: true,
                              ),
                            ],
                          ),
                        ],
                      ),
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

  Widget _buildResultsDashboard(BuildContext context) {
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
                    'Fitness Analysis',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your comprehensive physique assessment',
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
                    children: [
                      // Score Card
                      CustomCard(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Text(
                              'Physique Score',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '74',
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
                                widthFactor: 0.74,
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
                      
                      // Analysis Cards
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Critique',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Your upper body shows strong development, but a slight asymmetry is noted in the lats. Leanness is adequate but could be improved by 2-3% to reveal greater abdominal definition.',
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
                      
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Action Plan: Workout Protocol',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '• Add unilateral lat pulldowns to your routine',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• Increase weekly cardio by 20 minutes',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• Focus on mind-muscle connection',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Action Plan: Supplement Stack',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '• Creatine monohydrate: 5g daily',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• Whey protein: 25g post-workout',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• L-Carnitine: 2g pre-cardio',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'LibreBaskerville',
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
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