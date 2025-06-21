import 'package:flutter/material.dart';
import 'glass_container.dart';

class Sidebar extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onClose;
  final String userName;

  const Sidebar({
    super.key,
    required this.isOpen,
    required this.onClose,
    this.userName = 'John Doe',
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: isOpen ? 0 : -300,
      top: 0,
      bottom: 0,
      width: 300,
      child: GlassContainer(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        blur: 20,
        opacity: 0.15,
        child: Column(
          children: [
            const SizedBox(height: 60),
            
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'LibreBaskerville',
                    ),
                  ),
                ],
              ),
            ),
            
            const Divider(color: Colors.white24),
            
            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _buildMenuItem(
                    icon: Icons.space_dashboard,
                    title: 'My Space',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.category,
                    title: 'Categories',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.favorite_border,
                    title: 'Wishlist',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            
            // Bottom Menu
            Column(
              children: [
                const Divider(color: Colors.white24),
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {},
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white.withOpacity(0.8),
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 16,
          fontFamily: 'LibreBaskerville',
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}