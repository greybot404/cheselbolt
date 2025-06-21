import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/storage_service.dart';
import 'onboarding/gender_selection_screen.dart';
import 'main_screen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  User? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await StorageService.getUser();
    setState(() {
      _user = user;
      _isLoading = false;
    });
  }

  Future<void> _handleGenderSelection(String gender) async {
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      gender: gender,
      onboardingComplete: true,
    );
    
    await StorageService.setUser(user);
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      );
    }

    if (_user == null || !_user!.onboardingComplete) {
      return GenderSelectionScreen(
        onGenderSelect: _handleGenderSelection,
      );
    }

    return MainScreen(user: _user!);
  }
}