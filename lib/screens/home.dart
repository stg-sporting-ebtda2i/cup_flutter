import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/buttons_visibility_provider.dart';
import 'package:piehme_cup_flutter/screens/requested_attendance_screen.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:provider/provider.dart';
import 'show_quizzes_list.dart';
import 'lineup.dart';
import 'leaderboard.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
  final List<Widget> _widgetOptions = <Widget>[];
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeWidgets();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    // Create bounce animation
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );

    // Start animation after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  void _initializeWidgets() {
    ButtonsVisibilityProvider provider = context.read<ButtonsVisibilityProvider>();
    if (provider.isVisible('Mosab2a')) _widgetOptions.add(ShowQuizzesPage());
    if (provider.isVisible('Manage Attendance')) {
      _widgetOptions.add(RequestedAttendance());
    }
    if (provider.isVisible('Lineup')) {
      _widgetOptions.add(LineupPage(userLineup: true));
      _selectedIndex = _widgetOptions.length - 1;
    } else {
      _selectedIndex = 0;
    }
    if (provider.isVisible('Leaderboard')) _widgetOptions.add(Leaderboard());
    _widgetOptions.add(MoreOptionsPage());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<MainColorsExtension>();
    final Color navBarForeground = colors?.bottomNavBarForeground ?? Colors.grey;
    final Color navBarSelected = colors?.bottomNavBarSelected ?? Colors.greenAccent;
    final Color navBarColor = colors?.bottomNavBarBackground ?? Colors.greenAccent;

    final glow = [
      Shadow(color: navBarSelected.withAlpha(200), blurRadius: 8),
      Shadow(color: navBarSelected.withAlpha(150), blurRadius: 15),
      Shadow(color: navBarSelected.withAlpha(75), blurRadius: 24),
    ];

    ButtonsVisibilityProvider provider = context.read<ButtonsVisibilityProvider>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Main content
          Center(
            child: _widgetOptions.isNotEmpty
                ? _widgetOptions.elementAt(_selectedIndex)
                : const CircularProgressIndicator(),
          ),

          // Animated glass effect bottom navigation bar
          if (_widgetOptions.length >= 2)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 50 * (1 - _animation.value)),
                    child: Opacity(
                      opacity: _animation.value,
                      child: Transform.scale(
                        scale: 0.9 + (0.1 * _animation.value),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: navBarColor.withAlpha(180),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8, bottom: 4),
                                child: BottomNavigationBar(
                                  items: <BottomNavigationBarItem>[
                                    if (provider.isVisible('Mosab2a'))
                                      BottomNavigationBarItem(
                                        icon: Icon(Icons.quiz_rounded, color: navBarForeground),
                                        activeIcon: Icon(
                                          Icons.quiz_rounded,
                                          color: navBarSelected,
                                          shadows: glow,
                                        ),
                                        label: 'Mosab2a',
                                      ),
                                    if (provider.isVisible('Manage Attendance'))
                                      BottomNavigationBarItem(
                                        icon: Icon(Icons.church, color: navBarForeground),
                                        activeIcon: Icon(
                                          Icons.church,
                                          color: navBarSelected,
                                          shadows: glow,
                                        ),
                                        label: 'Hodour',
                                      ),
                                    if (provider.isVisible('Lineup'))
                                      BottomNavigationBarItem(
                                        icon: ImageIcon(
                                          AssetImage('assets/icons/tactics.png'),
                                          color: navBarForeground,
                                        ),
                                        activeIcon: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: navBarSelected.withAlpha(150),
                                                blurRadius: 12,
                                                spreadRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: ImageIcon(
                                            AssetImage('assets/icons/tactics.png'),
                                            color: navBarSelected,
                                          ),
                                        ),
                                        label: 'Lineup',
                                      ),
                                    if (provider.isVisible('Leaderboard'))
                                      BottomNavigationBarItem(
                                        icon: Icon(
                                          Icons.leaderboard_rounded,
                                          color: navBarForeground,
                                        ),
                                        activeIcon: Icon(
                                          Icons.leaderboard_rounded,
                                          color: navBarSelected,
                                          shadows: glow,
                                        ),
                                        label: 'Leaderboard',
                                      ),
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.person, size: 24, color: navBarForeground),
                                      activeIcon: Icon(
                                        Icons.person,
                                        size: 24,
                                        color: navBarSelected,
                                        shadows: glow,
                                      ),
                                      label: 'Profile',
                                    ),
                                  ],
                                  currentIndex: _selectedIndex,
                                  selectedItemColor: navBarSelected,
                                  unselectedItemColor: navBarForeground,
                                  onTap: _onItemTapped,
                                  type: BottomNavigationBarType.fixed,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}