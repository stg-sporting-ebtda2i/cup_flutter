import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/dialogs/alert_dialog.dart';
import 'package:piehme_cup_flutter/providers/buttons_visibility_provider.dart';
import 'package:piehme_cup_flutter/providers/header_provider.dart';
import 'package:piehme_cup_flutter/providers/user_provider.dart';
import 'package:piehme_cup_flutter/routes/app_routes.dart';
import 'package:piehme_cup_flutter/themes/backgrounds_extension.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';
import 'package:piehme_cup_flutter/themes/theme_switcher.dart';
import 'package:piehme_cup_flutter/widgets/animated_list_item.dart';
import 'package:piehme_cup_flutter/widgets/header.dart';
import 'package:piehme_cup_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class MoreOptionsPage extends StatefulWidget {
  const MoreOptionsPage({super.key});

  @override
  State<MoreOptionsPage> createState() => _MoreOptionsPageState();
}

class _MoreOptionsPageState extends State<MoreOptionsPage> {
  bool _confirmed = true;

  @override
  void initState() {
    super.initState();
    AuthService.getConfirmed().then((confirmed) {
      setState(() {
        _confirmed = confirmed;
      });
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => alertDialog(
        context: context,
        text: 'Are you sure that you want to logout?',
        positiveBtnText: 'Logout',
        positiveBtnAction: () {
          context.read<HeaderProvider>().stop();
          AuthService.logout();
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        },
      ),
    );
  }

  void _delete() {
    showDialog(
      context: context,
      builder: (context) => alertDialog(
        context: context,
        text: 'Are you sure that you want to delete your account?',
        positiveBtnText: 'Delete',
        positiveBtnAction: () async {
          await AuthService.delete();
          if (!context.mounted) return;
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topGradient = Theme.of(
      context,
    ).extension<MainColorsExtension>()!.topGradient;
    final mainColor = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.textColor;
    final themeSwitcher = Provider.of<ThemeSwitcher>(context);
    final isDark = themeSwitcher.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: topGradient,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.heightOf(context) * 0.08),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Theme.of(
                context,
              ).extension<BackgroundsExtension>()!.profileBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Enhanced Header
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 26),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [topGradient, Colors.transparent],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Header(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Consumer2<ButtonsVisibilityProvider, UserProvider>(
              builder: (context, provider, userProvider, child) {
                return Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Profile Header Section
                        AnimatedListItem(
                          index: 0,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  mainColor.withAlpha(38),
                                  mainColor.withAlpha(20),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: mainColor.withAlpha(51),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(77),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // User Avatar
                                Stack(
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Theme.of(context)
                                                .extension<
                                                BackgroundsExtension
                                            >()!
                                                .profileBackground,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: mainColor.withAlpha(89)
                                                .withAlpha(102),
                                            blurRadius: 30,
                                            offset: const Offset(3, 6),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: ClipOval(
                                          child:
                                          userProvider.user.imageUrl != null
                                              ? CachedNetworkImage(
                                            imageUrl: userProvider
                                                .user
                                                .imageUrl!,
                                            cacheKey: userProvider
                                                .user
                                                .imageKey,
                                            fit: BoxFit.cover,
                                            placeholder:
                                                (context, url) =>
                                                Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    Colors.grey[800],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Center(
                                                    child:
                                                    CircularProgressIndicator(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                            errorWidget: (
                                                context,
                                                url,
                                                error,
                                                ) =>
                                                Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    Colors.grey[800],
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.person_rounded,
                                                    color: mainColor,
                                                    size: 40,
                                                  ),
                                                ),
                                          )
                                              : Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[800],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.person_rounded,
                                              color: mainColor,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (userProvider.isLoading)
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black.withAlpha(153),
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: mainColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                // User Name
                                Text(
                                  userProvider.user.name,
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // About App Section
                        AnimatedListItem(
                          index: 1,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  mainColor.withAlpha(31),
                                  mainColor.withAlpha(15),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: mainColor.withAlpha(38),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.games_rounded,
                                      color: Colors.blue.shade300,
                                      size: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'About The App',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                _buildAboutRow(
                                  icon: Icons.flag_rounded,
                                  text: 'The Road to Golgotha',
                                  mainColor: mainColor,
                                ),
                                const SizedBox(height: 12),
                                _buildAboutRow(
                                  icon: Icons.group_rounded,
                                  text: 'St. George Church Sporting',
                                  mainColor: mainColor,
                                ),
                                const SizedBox(height: 12),
                                _buildAboutRow(
                                  icon: Icons.location_pin,
                                  text: 'Alexandria, Egypt',
                                  mainColor: mainColor,
                                ),
                                const SizedBox(height: 12),
                                _buildAboutRow(
                                  icon: Icons.phone_android_rounded,
                                  text: 'Version 3.1.0 • 2026',
                                  mainColor: mainColor,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Action Buttons Section (Now includes Theme Toggle)
                        AnimatedListItem(
                          index: 2,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  mainColor.withAlpha(31),
                                  mainColor.withAlpha(15),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: mainColor.withAlpha(38),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(51),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Theme Toggle Button (Now inside the box)
                                _buildThemeToggleButton(
                                  icon: isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                                  title: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                                  subtitle: 'Change app appearance',
                                  onTap: () => themeSwitcher.toggleTheme(),
                                  color: mainColor,
                                  mainColor: mainColor,
                                ),

                                const SizedBox(height: 16),

                                // Divider
                                Container(
                                  height: 1,
                                  color: mainColor.withAlpha(26),
                                ),

                                const SizedBox(height: 16),

                                // Logout Button
                                _buildEnhancedProfileButton(
                                  icon: Icons.logout_rounded,
                                  title: 'Logout',
                                  subtitle: 'Sign out of your account',
                                  onTap: _logout,
                                  color: Colors.red.shade400,
                                  mainColor: mainColor,
                                ),

                                if (!_confirmed) const SizedBox(height: 16),

                                // Delete Account Button
                                if (!_confirmed)
                                  _buildEnhancedProfileButton(
                                    icon: Icons.delete_forever_rounded,
                                    title: 'Delete Account',
                                    subtitle: 'Permanently delete your account',
                                    onTap: _delete,
                                    color: Colors.red.shade700,
                                    mainColor: mainColor,
                                  ),
                              ],
                            ),
                          ),
                        ),

                        // App Footer
                        AnimatedListItem(
                          index: 3,
                          child: Container(
                            margin: const EdgeInsets.only(top: 25),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  'The Road to Golgotha',
                                  style: TextStyle(
                                    color: mainColor.withAlpha(204),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'St. George Sporting, Alex.',
                                  style: TextStyle(
                                    color: mainColor.withAlpha(153),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutRow({
    required IconData icon,
    required String text,
    required Color mainColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue.shade300, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: mainColor.withAlpha(230),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThemeToggleButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
    required Color mainColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: color.withAlpha(51),
        highlightColor: color.withAlpha(26),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: mainColor.withAlpha(26), width: 1),
            gradient: LinearGradient(
              colors: [color.withAlpha(26), color.withAlpha(13)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withAlpha(38),
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withAlpha(77), width: 1.5),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: mainColor.withAlpha(179),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: mainColor.withAlpha(128),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedProfileButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required Color color,
    required Color mainColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: color.withAlpha(51),
        highlightColor: color.withAlpha(26),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: mainColor.withAlpha(26), width: 1),
            gradient: LinearGradient(
              colors: [color.withAlpha(26), color.withAlpha(13)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withAlpha(38),
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withAlpha(77), width: 1.5),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: mainColor.withAlpha(179),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: mainColor.withAlpha(128),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}