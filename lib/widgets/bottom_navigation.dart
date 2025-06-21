import 'package:flutter/material.dart';
import 'glass_container.dart';

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
      margin: const EdgeInsets.all(16),
      child: GlassContainer(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        borderRadius: BorderRadius.circular(24),
        blur: 20,
        opacity: 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tabs.map((tab) {
            final isActive = activeTab == tab['id'];
            return GestureDetector(
              onTap: () => onTabChange(tab['id'] as String),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: isActive 
                      ? const Color(0xFF6366F1).withOpacity(0.3)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: isActive
                      ? Border.all(
                          color: const Color(0xFF6366F1).withOpacity(0.5),
                          width: 1,
                        )
                      : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      tab['icon'] as IconData,
                      size: 20,
                      color: isActive 
                          ? const Color(0xFF6366F1)
                          : Colors.white.withOpacity(0.6),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tab['label'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'LibreBaskerville',
                        color: isActive 
                            ? const Color(0xFF6366F1)
                            : Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}