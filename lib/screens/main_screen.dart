import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/storage_service.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/sidebar.dart';
import 'home/enhanced_daily_protocol_screen.dart';
import 'fitness/fitness_screen.dart';
import 'fashion/fashion_screen.dart';
import 'body/body_screen.dart';
import 'presence/presence_screen.dart';
import 'scores/scores_overview_screen.dart';
import 'food/food_scanner_screen.dart';

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({
    super.key,
    required this.user,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  String _activeTab = 'home';
  List<Mission> _missions = [];
  Map<String, dynamic> _fitnessData = {};
  Map<String, dynamic> _fashionData = {};
  Map<String, dynamic> _bodyData = {'activeTab': 'face'};
  Map<String, dynamic> _presenceData = {'messages': []};
  bool _sidebarOpen = false;
  late AnimationController _sidebarController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _loadData();
    _sidebarController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.85,
    ).animate(CurvedAnimation(
      parent: _sidebarController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _sidebarController.dispose();
    super.dispose();
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

  void _toggleSidebar() {
    setState(() {
      _sidebarOpen = !_sidebarOpen;
    });
    if (_sidebarOpen) {
      _sidebarController.forward();
    } else {
      _sidebarController.reverse();
    }
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

  void _showScoresOverview() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ScoresOverviewScreen(),
      ),
    );
  }

  void _showFoodScanner() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FoodScannerScreen(),
      ),
    );
  }

  Widget _buildActiveScreen() {
    switch (_activeTab) {
      case 'home':
        return EnhancedDailyProtocolScreen(
          missions: _missions,
          onMarkComplete: _handleMarkComplete,
          onScanFood: _showFoodScanner,
          onViewScores: _showScoresOverview,
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
        return EnhancedDailyProtocolScreen(
          missions: _missions,
          onMarkComplete: _handleMarkComplete,
          onScanFood: _showFoodScanner,
          onViewScores: _showScoresOverview,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform.translate(
                  offset: Offset(_sidebarOpen ? 100 : 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(_sidebarOpen ? 20 : 0),
                    child: Stack(
                      children: [
                        _buildActiveScreen(),
                        
                        // Menu Button
                        Positioned(
                          top: 50,
                          left: 20,
                          child: GestureDetector(
                            onTap: _toggleSidebar,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Sidebar
          Sidebar(
            isOpen: _sidebarOpen,
            onClose: _toggleSidebar,
            userName: 'John Doe',
          ),
          
          // Bottom Navigation
          if (!_sidebarOpen)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigation(
                activeTab: _activeTab,
                onTabChange: _handleTabChange,
              ),
            ),
        ],
      ),
    );
  }
}