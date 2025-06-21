import 'package:flutter/material.dart';
import '../../widgets/glass_container.dart';
import '../../widgets/animated_score_meter.dart';

class FoodScannerScreen extends StatefulWidget {
  const FoodScannerScreen({super.key});

  @override
  State<FoodScannerScreen> createState() => _FoodScannerScreenState();
}

class _FoodScannerScreenState extends State<FoodScannerScreen> {
  bool _isScanning = false;
  bool _showResults = false;

  void _startScan() {
    setState(() {
      _isScanning = true;
    });
    
    // Simulate scanning
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isScanning = false;
        _showResults = true;
      });
    });
  }

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
                      'Food Scanner',
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
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: _showResults ? _buildResults() : _buildScanner(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScanner() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlassContainer(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              if (_isScanning) ...[
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: Color(0xFF6366F1),
                    strokeWidth: 3,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Analyzing food...',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
              ] else ...[
                Icon(
                  Icons.camera_alt_outlined,
                  size: 80,
                  color: Colors.white.withOpacity(0.6),
                ),
                const SizedBox(height: 24),
                Text(
                  'Scan Your Food',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Point your camera at food to get instant nutrition analysis and personalized recommendations',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: 'LibreBaskerville',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _startScan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Start Scanning',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResults() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Identification
          GlassContainer(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Identified Food',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Grilled Chicken Breast with Vegetables',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Nutrition Score
          GlassContainer(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                AnimatedScoreMeter(
                  score: 88,
                  title: 'Nutrition',
                  primaryColor: const Color(0xFF10B981),
                  secondaryColor: const Color(0xFF059669),
                  size: 100,
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Excellent Choice!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF10B981),
                          fontFamily: 'LibreBaskerville',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This meal aligns perfectly with your fitness goals.',
                        style: TextStyle(
                          fontSize: 14,
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
          
          const SizedBox(height: 16),
          
          // Nutrition Facts
          GlassContainer(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nutrition Facts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
                const SizedBox(height: 16),
                _buildNutritionRow('Calories', '320', 'kcal'),
                _buildNutritionRow('Protein', '45', 'g'),
                _buildNutritionRow('Carbs', '8', 'g'),
                _buildNutritionRow('Fat', '12', 'g'),
                _buildNutritionRow('Fiber', '4', 'g'),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Recommendations
          GlassContainer(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalized Recommendations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
                const SizedBox(height: 16),
                _buildRecommendation(
                  '✓ Perfect for muscle building goals',
                  const Color(0xFF10B981),
                ),
                _buildRecommendation(
                  '• Add 50g brown rice for energy',
                  Colors.white.withOpacity(0.8),
                ),
                _buildRecommendation(
                  '• Consider post-workout timing',
                  Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionRow(String label, String value, String unit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
              fontFamily: 'LibreBaskerville',
            ),
          ),
          Text(
            '$value $unit',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'LibreBaskerville',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: color,
          fontFamily: 'LibreBaskerville',
        ),
      ),
    );
  }
}