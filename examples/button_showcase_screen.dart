import 'package:flutter/material.dart';
import 'package:ds_o1/ds_o1.dart';
import 'shared/showcase_widgets.dart';

class ButtonShowcaseScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const ButtonShowcaseScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<ButtonShowcaseScreen> createState() => _ButtonShowcaseScreenState();
}

class _ButtonShowcaseScreenState extends State<ButtonShowcaseScreen> {
  String _selectedSection = 'Button Variants';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Button System'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: widget.onThemeToggle,
            tooltip: widget.isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          // Sidebar Navigation
          Container(
            width: 284,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 65),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      O1Text(
                        'Button System',
                        style: O1TextStyle.titleLarge,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(height: 44),
                      // Navigation Items
                      ShowcaseNavItem(
                        title: 'Button Variants',
                        isSelected: _selectedSection == 'Button Variants',
                        onTap: () => setState(() => _selectedSection = 'Button Variants'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'States',
                        isSelected: _selectedSection == 'States',
                        onTap: () => setState(() => _selectedSection = 'States'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Sizing',
                        isSelected: _selectedSection == 'Sizing',
                        onTap: () => setState(() => _selectedSection = 'Sizing'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Usage Guidelines',
                        isSelected: _selectedSection == 'Usage Guidelines',
                        onTap: () => setState(() => _selectedSection = 'Usage Guidelines'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Code Examples',
                        isSelected: _selectedSection == 'Code Examples',
                        onTap: () => setState(() => _selectedSection = 'Code Examples'),
                      ),
                      const SizedBox(height: 44),
                      // Quick Reference Card
                      QuickReferenceCard(
                        items: [
                          const QuickRefItem(title: 'Primary', spec: '#1977FF'),
                          const QuickRefItem(title: 'Secondary', spec: 'Outlined'),
                          const QuickRefItem(title: 'Text Button', spec: 'Transparent'),
                          const QuickRefItem(title: 'Border Radius', spec: '8px'),
                          const QuickRefItem(title: 'Min Height', spec: '44px'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(80),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    O1Text(
                      'Button System',
                      style: O1TextStyle.displayLarge,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'A comprehensive button system designed for consistent interactions across the OnlyOne Wallet application. Built with accessibility and usability in mind.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 75),
                    // Button Variants Section
                    _buildButtonVariantsSection(),
                    const SizedBox(height: 75),
                    // Button States Section
                    _buildButtonStatesSection(),
                    const SizedBox(height: 75),
                    // Button Sizing Section
                    _buildButtonSizingSection(),
                    const SizedBox(height: 75),
                    // Usage Examples Section
                    _buildUsageExamplesSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Button Variants',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Primary Button',
          description: 'Used for primary actions and main CTAs',
          spec: 'Background: #1977FF',
          detail: 'Text: White',
          previewChild: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              O1Button(
                text: 'Create Credential',
                onPressed: () {},
                type: O1ButtonType.primary,
              ),
              const SizedBox(width: 16),
              O1Button(
                text: 'Add Credential',
                onPressed: () {},
                type: O1ButtonType.primary,
                icon: const Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ],
          ),
          code:
              'class="bg-primary text-white px-4 py-3 rounded-lg text-body-large font-medium hover:bg-primary-dark transition-colors min-h-[44px]"',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Secondary Button',
          description: 'Used for secondary actions and alternative options',
          spec: 'Border: #1977FF',
          detail: 'Text: #1977FF',
          previewChild: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              O1Button(
                text: 'View Details',
                onPressed: () {},
                type: O1ButtonType.secondary,
              ),
              const SizedBox(width: 16),
              O1Button(
                text: 'View Details',
                onPressed: () {},
                type: O1ButtonType.secondary,
                icon: Icon(
                  Icons.visibility_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          code:
              'class="border border-primary text-primary bg-transparent px-4 py-3 rounded-lg text-body-large font-medium hover:bg-primary hover:text-white transition-colors min-h-[44px]"',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Text Button',
          description: 'Used for subtle actions and navigation',
          spec: 'Background: Transparent',
          detail: 'Text: #1977FF',
          previewChild: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              O1Button(
                text: 'Learn More',
                onPressed: () {},
                type: O1ButtonType.text,
              ),
              const SizedBox(width: 16),
              O1Button(
                text: 'Continue',
                onPressed: () {},
                type: O1ButtonType.text,
                icon: Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          code:
              'class="text-primary bg-transparent px-4 py-3 rounded-lg text-body-large font-medium hover:bg-primary/10 transition-colors min-h-[44px]"',
        ),
      ],
    );
  }

  Widget _buildButtonStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Button States',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        // Primary Button States
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                O1Text(
                  'Primary Button States',
                  style: O1TextStyle.titleLarge,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16),
                Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStateButton(
                          'Default',
                          Theme.of(context).colorScheme.primary,
                        ),
                        _buildStateButton('Hover', const Color(0xFF1565C0)),
                        _buildStateButton('Focus', const Color(0xFF1565C0)),
                        _buildStateButton('Active', const Color(0xFF1565C0)),
                        _buildStateButton('Disable', const Color(0xFFA3C9FF)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Secondary Button States
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                O1Text(
                  'Secondary Button States',
                  style: O1TextStyle.titleLarge,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16),
                Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSecondaryStateButton('Default', false),
                        _buildSecondaryStateButton('Hover', true),
                        _buildSecondaryStateButton('Focus', false),
                        _buildSecondaryStateButton('Active', true),
                        _buildSecondaryStateButton(
                          'Disable',
                          false,
                          const Color(0xFFA3C9FF),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStateButton(String label, Color backgroundColor) {
    return Column(
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryStateButton(
    String label,
    bool filled, [
    Color? borderColor,
  ]) {
    final useColor = borderColor ?? Theme.of(context).colorScheme.primary;
    return Column(
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: filled
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            border: Border.all(color: useColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: filled ? Colors.white : useColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSizingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Button Sizing',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                O1Text(
                  'Size Variations',
                  style: O1TextStyle.titleLarge,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16),
                Card(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            O1Button(
                              text: 'Large',
                              onPressed: () {},
                              type: O1ButtonType.primary,
                              size: O1ButtonSize.large,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Large: 56px height, 24px vertical padding',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            O1Button(
                              text: 'Default',
                              onPressed: () {},
                              type: O1ButtonType.primary,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Default: 48px height, 12px vertical padding',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            O1Button(
                              text: 'Small',
                              onPressed: () {},
                              type: O1ButtonType.primary,
                              size: O1ButtonSize.small,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Small: 32px height, 8px vertical padding',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUsageExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Usage Examples',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                O1Text(
                  'Credential Management Actions',
                  style: O1TextStyle.titleLarge,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1977FF), Color(0xFF1565C0)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'UNIVERSITY DEGREE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          const Icon(
                            Icons.verified,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Computer Science Degree',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Stanford University • Issued March 2024',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    O1Button(
                      text: 'Share',
                      onPressed: () {},
                      type: O1ButtonType.primary,
                      icon: const Icon(
                        Icons.share,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    O1Button(
                      text: 'View Details',
                      onPressed: () {},
                      type: O1ButtonType.secondary,
                      icon: Icon(
                        Icons.visibility_outlined,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
