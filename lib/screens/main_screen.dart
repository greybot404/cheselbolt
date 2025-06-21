import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/storage_service.dart';
import '../widgets/bottom_navigation.dart';
import 'home/daily_protocol_screen.dart';
import 'fitness/fitness_screen.dart';
import 'fashion/fashion_screen.dart';
import 'body/body_screen.dart';
import 'presence/presence_screen.dart';

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({
    super.key,
    required this.user,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _activeTab = 'home';
  List<Mission> _missions = [];
  Map<String, dynamic> _fitnessData = {};
  Map<String, dynamic> _fashionData = {};
  Map<String, dynamic> _bodyData = {'activeTab': 'face'};
  Map<String, dynamic> _presenceData = {'messages': []};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final activeTab = await StorageService.getActiveTab();
    final missions = await StorageService.getMissions();
    final fitnessData = await StorageService.getFitnessData();
    final fashionData = await StorageService.getFashionData();
    final bodyData = await StorageService.getBodyData();
    final presenceData = await StorageService.getPresenceData();

    setState(() {
      _activeTab = activeTab;
      _missions = missions;
      _fitnessData = fitnessData;
      _fashionData = fashionData;
      _bodyData = bodyData;
      _presenceData = presenceData;
    });
  }

  Future<void> _handleTabChange(String tab) async {
    await StorageService.setActiveTab(tab);
    setState(() {
      _activeTab = tab;
    });
  }

  Future<void> _handleMarkComplete(String missionId) async {
    final updatedMissions = _missions.map((mission) {
      if (mission.id == missionId) {
        return mission.copyWith(completed: true);
      }
      return mission;
    }).toList();

    await StorageService.setMissions(updatedMissions);
    setState(() {
      _missions = updatedMissions;
    });
  }

  Future<void> _updateFitnessData(Map<String, dynamic> data) async {
    final updatedData = {..._fitnessData, ...data};
    await StorageService.setFitnessData(updatedData);
    setState(() {
      _fitnessData = updatedData;
    });
  }

  Future<void> _updateFashionData(Map<String, dynamic> data) async {
    final updatedData = {..._fashionData, ...data};
    await StorageService.setFashionData(updatedData);
    setState(() {
      _fashionData = updatedData;
    });
  }

  Future<void> _updateBodyData(Map<String, dynamic> data) async {
    final updatedData = {..._bodyData, ...data};
    await StorageService.setBodyData(updatedData);
    setState(() {
      _bodyData = updatedData;
    });
  }

  Future<void> _updatePresenceData(Map<String, dynamic> data) async {
    final updatedData = {..._presenceData, ...data};
    await StorageService.setPresenceData(updatedData);
    setState(() {
      _presenceData = updatedData;
    });
  }

  Widget _buildActiveScreen() {
    switch (_activeTab) {
      case 'home':
        return DailyProtocolScreen(
          missions: _missions,
          onMarkComplete: _handleMarkComplete,
        );
      case 'fitness':
        return FitnessScreen(
          data: _fitnessData,
          onDataUpdate: _updateFitnessData,
        );
      case 'fashion':
        return FashionScreen(
          data: _fashionData,
          onDataUpdate: _updateFashionData,
        );
      case 'body':
        return BodyScreen(
          user: widget.user,
          data: _bodyData,
          onDataUpdate: _updateBodyData,
        );
      case 'presence':
        return PresenceScreen(
          data: _presenceData,
          onDataUpdate: _updatePresenceData,
        );
      default:
        return DailyProtocolScreen(
          missions: _missions,
          onMarkComplete: _handleMarkComplete,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildActiveScreen(),
      bottomNavigationBar: BottomNavigation(
        activeTab: _activeTab,
        onTabChange: _handleTabChange,
      ),
    );
  }
}