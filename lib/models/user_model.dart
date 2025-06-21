class User {
  final String id;
  final String gender;
  final bool onboardingComplete;

  User({
    required this.id,
    required this.gender,
    required this.onboardingComplete,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gender': gender,
      'onboardingComplete': onboardingComplete,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      gender: json['gender'],
      onboardingComplete: json['onboardingComplete'],
    );
  }
}

class Mission {
  final String id;
  final String title;
  final String description;
  final String module;
  final bool completed;
  final String date;

  Mission({
    required this.id,
    required this.title,
    required this.description,
    required this.module,
    required this.completed,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'module': module,
      'completed': completed,
      'date': date,
    };
  }

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      module: json['module'],
      completed: json['completed'],
      date: json['date'],
    );
  }

  Mission copyWith({
    String? id,
    String? title,
    String? description,
    String? module,
    bool? completed,
    String? date,
  }) {
    return Mission(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      module: module ?? this.module,
      completed: completed ?? this.completed,
      date: date ?? this.date,
    );
  }
}

class AnalysisResult {
  final int score;
  final String critique;
  final List<String> actionPlan;

  AnalysisResult({
    required this.score,
    required this.critique,
    required this.actionPlan,
  });

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'critique': critique,
      'actionPlan': actionPlan,
    };
  }

  factory AnalysisResult.fromJson(Map<String, dynamic> json) {
    return AnalysisResult(
      score: json['score'],
      critique: json['critique'],
      actionPlan: List<String>.from(json['actionPlan']),
    );
  }
}

class PresenceMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;

  PresenceMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory PresenceMessage.fromJson(Map<String, dynamic> json) {
    return PresenceMessage(
      id: json['id'],
      text: json['text'],
      isUser: json['isUser'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}