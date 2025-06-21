import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';

class GenderSelectionScreen extends StatefulWidget {
  final Function(String) onGenderSelect;

  const GenderSelectionScreen({
    super.key,
    required this.onGenderSelect,
  });

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? _selectedGender;

  void _handleSelection(String gender) {
    setState(() {
      _selectedGender = gender;
    });
    
    // Small delay for visual feedback
    Future.delayed(const Duration(milliseconds: 200), () {
      widget.onGenderSelect(gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Header
              Column(
                children: [
                  Text(
                    'Select Profile',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Choose your profile to personalize your experience',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              
              const SizedBox(height: 48),
              
              // Gender Cards
              Column(
                children: [
                  CustomCard(
                    onTap: () => _handleSelection('male'),
                    selected: _selectedGender == 'male',
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(
                          _selectedGender == 'male' 
                              ? Icons.check_circle 
                              : Icons.person,
                          size: 48,
                          color: _selectedGender == 'male' 
                              ? Colors.black 
                              : Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Male',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontFamily: 'LibreBaskerville',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  CustomCard(
                    onTap: () => _handleSelection('female'),
                    selected: _selectedGender == 'female',
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Icon(
                          _selectedGender == 'female' 
                              ? Icons.check_circle 
                              : Icons.person,
                          size: 48,
                          color: _selectedGender == 'female' 
                              ? Colors.black 
                              : Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Female',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}