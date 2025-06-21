import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class StorageService {
  static const String _userKey = 'chesel-user';
  static const String _activeTabKey = 'chesel-active-tab';
  static const String _missionsKey = 'chesel-missions';
  static const String _fitnessDataKey = 'chesel-fitness';
  static const String _fashionDataKey = 'chesel-fashion';
  static const String _bodyDataKey = 'chesel-body';
  static const String _presenceDataKey = 'chesel-presence';

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  // User methods
  static Future<User?> getUser() async {
    final prefs = await _prefs;
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  static Future<void> setUser(User user) async {
    final prefs = await _prefs;
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  // Active tab methods
  static Future<String> getActiveTab() async {
    final prefs = await _prefs;
    return prefs.getString(_activeTabKey) ?? 'home';
  }

  static Future<void> setActiveTab(String tab) async {
    final prefs = await _prefs;
    await prefs.setString(_activeTabKey, tab);
  }

  // Missions methods
  static Future<List<Mission>> getMissions() async {
    final prefs = await _prefs;
    final missionsJson = prefs.getString(_missionsKey);
    if (missionsJson != null) {
      final List<dynamic> missionsList = jsonDecode(missionsJson);
      return missionsList.map((json) => Mission.fromJson(json)).toList();
    }
    return _getDefaultMissions();
  }

  static Future<void> setMissions(List<Mission> missions) async {
    final prefs = await _prefs;
    final missionsJson = missions.map((m) => m.toJson()).toList();
    await prefs.setString(_missionsKey, jsonEncode(missionsJson));
  }

  static List<Mission> _getDefaultMissions() {
    return [
      Mission(
        id: '1',
        title: 'Fitness & Presence',
        description:
            'Your analysis indicates a slight pectoral imbalance. Add one additional set of incline dumbbell press to your next workout.',
        module: 'Fitness',
        completed: false,
        date: DateTime.now().toIso8601String().split('T')[0],
      ),
      Mission(
        id: '2',
        title: 'Vocal Authority',
        description:
            'In your next phone call, consciously lower your vocal pitch by 10%. Project authority.',
        module: 'Presence',
        completed: false,
        date: DateTime.now().toIso8601String().split('T')[0],
      ),
    ];
  }

  // Generic data methods
  static Future<Map<String, dynamic>> getData(String key) async {
    final prefs = await _prefs;
    final dataJson = prefs.getString(key);
    if (dataJson != null) {
      return jsonDecode(dataJson);
    }
    return {};
  }

  static Future<void> setData(String key, Map<String, dynamic> data) async {
    final prefs = await _prefs;
    await prefs.setString(key, jsonEncode(data));
  }

  // Specific data getters
  static Future<Map<String, dynamic>> getFitnessData() async {
    return await getData(_fitnessDataKey);
  }

  static Future<void> setFitnessData(Map<String, dynamic> data) async {
    await setData(_fitnessDataKey, data);
  }

  static Future<Map<String, dynamic>> getFashionData() async {
    return await getData(_fashionDataKey);
  }

  static Future<void> setFashionData(Map<String, dynamic> data) async {
    await setData(_fashionDataKey, data);
  }

  static Future<Map<String, dynamic>> getBodyData() async {
    final data = await getData(_bodyDataKey);
    if (data.isEmpty) {
      return {'activeTab': 'face'};
    }
    return data;
  }

  static Future<void> setBodyData(Map<String, dynamic> data) async {
    await setData(_bodyDataKey, data);
  }

  static Future<Map<String, dynamic>> getPresenceData() async {
    final data = await getData(_presenceDataKey);
    if (data.isEmpty) {
      return {'messages': []};
    }
    return data;
  }

  static Future<void> setPresenceData(Map<String, dynamic> data) async {
    await setData(_presenceDataKey, data);
  }
}