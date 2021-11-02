import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.

        child: Column(
          children: [
            // When a user selects a theme from the dropdown list, the
            // SettingsController is updated, which rebuilds the MaterialApp.
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            // When a user selects a locale from the dropdown list, the
            // SettingsController is updated, which rebuilds the MaterialApp.
            DropdownButton<Locale>(
              // Read the selected locale from the controller
              value: controller.locale,
              // Call the setLocale method any time the user selects a languange.
              onChanged: controller.setLocale,
              items: const [
                DropdownMenuItem(
                  value: null,
                  child: Text('System Languange'),
                ),
                DropdownMenuItem(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('id', ''),
                  child: Text('Indonesia'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
