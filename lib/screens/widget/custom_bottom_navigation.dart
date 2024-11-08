import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double containerHeight = Platform.isIOS ? 100.0 : 70.0;

    return Theme(
      data: Theme.of(context).copyWith(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4285F4),
              );
            }
            return GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF5F93CF),
            );
          }),
        ),
      ),
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          color: const Color(0xFFB3CEFA),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          onDestinationSelected: onItemSelected,
          selectedIndex: selectedIndex,
          indicatorColor: _getSelectedColor(selectedIndex),
          destinations: <Widget>[
            _buildNavigationDestination(
                Icons.home, Icons.home_outlined, 'Home', 0),
            _buildNavigationDestination(
                Icons.person, Icons.person_outline, 'Akun', 1),
            _buildNavigationDestination(
                Icons.logout, Icons.logout_outlined, 'Logout', 2),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 30,
          backgroundColor: const Color(0xFFB3CEFA),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

  NavigationDestination _buildNavigationDestination(
      IconData selectedIcon, IconData icon, String label, int index) {
    return NavigationDestination(
      icon: Icon(icon, color: const Color(0xFF5F93CF)),
      selectedIcon: Icon(selectedIcon, color: const Color(0xFF4285F4)),
      label: label,
    );
  }

  Color _getSelectedColor(int index) {
    return Colors.grey[100]!;
  }
}
