import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const BottomNavigation({
    super.key,
    required this.activeTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'id': 'home', 'label': 'Home', 'icon': Icons.home_outlined},
      {'id': 'fitness', 'label': 'Fitness', 'icon': Icons.fitness_center_outlined},
      {'id': 'fashion', 'label': 'Fashion', 'icon': Icons.checkroom_outlined},
      {'id': 'body', 'label': 'Body', 'icon': Icons.person_outline},
      {'id': 'presence', 'label': 'Presence', 'icon': Icons.psychology_outlined},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: tabs.map((tab) {
              final isActive = activeTab == tab['id'];
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTabChange(tab['id'] as String),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          tab['icon'] as IconData,
                          size: 20,
                          color: isActive ? Colors.black : Colors.grey[400],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          tab['label'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'LibreBaskerville',
                            color: isActive ? Colors.black : Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}