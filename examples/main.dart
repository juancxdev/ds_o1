import 'package:flutter/material.dart';
import 'package:ds_o1/ds_o1.dart';
import 'typography_showcase_screen.dart';
import 'button_showcase_screen.dart';
import 'input_showcase_screen.dart';

void main() {
  runApp(const O1DesignSystemExampleApp());
}

class O1DesignSystemExampleApp extends StatefulWidget {
  const O1DesignSystemExampleApp({super.key});

  @override
  State<O1DesignSystemExampleApp> createState() =>
      _O1DesignSystemExampleAppState();
}

class _O1DesignSystemExampleAppState extends State<O1DesignSystemExampleApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O1 Design System',
      theme: O1Theme.lightTheme,
      darkTheme: O1Theme.darkTheme,
      themeMode: _themeMode,
      home: HomeScreen(
        onThemeToggle: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomeScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('O1 Design System'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: onThemeToggle,
            tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: O1Colors.primary500,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.palette,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 24),
              O1Text(
                'OnlyOne Design System',
                style: O1TextStyle.displayLarge,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 16),
              Text(
                'Explore the comprehensive design system for the OnlyOne Wallet application.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
              const SizedBox(height: 48),

              // Navigation Cards
              O1Text(
                'Components',
                style: O1TextStyle.titleMedium,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 16),

              _buildNavigationCard(
                context,
                title: 'Typography System',
                description: 'Explore text styles, hierarchy, and usage guidelines',
                icon: Icons.text_fields,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TypographyShowcaseScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              _buildNavigationCard(
                context,
                title: 'Button System',
                description: 'Discover button variants, states, and sizing options',
                icon: Icons.touch_app,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ButtonShowcaseScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              _buildNavigationCard(
                context,
                title: 'Input System',
                description: 'Explore text fields, states, and input patterns',
                icon: Icons.edit_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputShowcaseScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
