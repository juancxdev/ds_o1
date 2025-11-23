import 'package:flutter/material.dart';
import 'package:ds_o1/ds_o1.dart';
import 'shared/showcase_widgets.dart';

class TypographyShowcaseScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const TypographyShowcaseScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<TypographyShowcaseScreen> createState() =>
      _TypographyShowcaseScreenState();
}

class _TypographyShowcaseScreenState extends State<TypographyShowcaseScreen> {
  String _selectedSection = 'Hierarchy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Typography System'),
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
                        'Typography System',
                        style: O1TextStyle.titleLarge,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(height: 44),
                      // Navigation Items
                      ShowcaseNavItem(
                        title: 'Hierarchy',
                        isSelected: _selectedSection == 'Hierarchy',
                        onTap: () =>
                            setState(() => _selectedSection = 'Hierarchy'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Body Text',
                        isSelected: _selectedSection == 'Body Text',
                        onTap: () =>
                            setState(() => _selectedSection = 'Body Text'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Utility Text',
                        isSelected: _selectedSection == 'Utility Text',
                        onTap: () =>
                            setState(() => _selectedSection = 'Utility Text'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Usage Examples',
                        isSelected: _selectedSection == 'Usage Examples',
                        onTap: () =>
                            setState(() => _selectedSection = 'Usage Examples'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Color Usage',
                        isSelected: _selectedSection == 'Color Usage',
                        onTap: () =>
                            setState(() => _selectedSection = 'Color Usage'),
                      ),
                      const SizedBox(height: 44),
                      // Quick Reference Card
                      QuickReferenceCard(
                        items: [
                          const QuickRefItem(
                            title: 'Large Heading',
                            spec: '32px Bold',
                          ),
                          const QuickRefItem(
                            title: 'Medium Heading',
                            spec: '24px Bold',
                          ),
                          const QuickRefItem(
                            title: 'Small Heading',
                            spec: '20px Bold',
                          ),
                          const QuickRefItem(
                            title: 'Body Large',
                            spec: '16px Medium',
                          ),
                          const QuickRefItem(
                            title: 'Body Regular',
                            spec: '14px Regular',
                          ),
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
                      'Typography System',
                      style: O1TextStyle.displayLarge,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'A comprehensive typography system designed for optimal readability and visual hierarchy across the OnlyOne Wallet application. Built on system fonts for consistent cross-platform experience.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 75),
                    // Hierarchy Section
                    _buildHierarchySection(),
                    const SizedBox(height: 75),
                    // Body Text Section
                    _buildBodyTextSection(),
                    const SizedBox(height: 75),
                    // Utility Text Section
                    _buildUtilityTextSection(),
                    const SizedBox(height: 75),
                    // Color Usage Section
                    _buildColorUsageSection(),
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

  Widget _buildHierarchySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Hierarchy',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Large Heading',
          description: 'Used for main titles and hero sections',
          spec: '32px / Bold',
          detail: 'font-weight: 700',
          previewChild: O1Text(
            'Manage Your Digital Identity',
            style: O1TextStyle.displayLarge,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          code: 'class="text-heading-large text-text-primary"',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Medium Heading',
          description: 'Used for section headers and card titles',
          spec: '24px / Bold',
          detail: 'font-weight: 700',
          previewChild: O1Text(
            'Your Credentials',
            style: O1TextStyle.headlineMedium,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          code: 'class="text-heading-medium text-text-primary"',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Small Heading',
          description: 'Used for subsection headers and component labels',
          spec: '20px / Bold',
          detail: 'font-weight: 700',
          previewChild: O1Text(
            'Recent Activity',
            style: O1TextStyle.titleLarge,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          code: 'class="text-heading-small text-text-primary"',
        ),
      ],
    );
  }

  Widget _buildBodyTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Body Text',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Body Large',
          description: 'Used for primary content and important text',
          spec: '16px / Medium',
          detail: 'font-weight: 500',
          previewChild: O1Text(
            'Your digital identity is secured using advanced cryptographic protocols, ensuring complete privacy and control over your personal data.',
            style: O1TextStyle.bodyLarge,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          code: 'class="text-body-large text-text-primary"',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Body Regular',
          description: 'Used for standard content and descriptions',
          spec: '14px / Regular',
          detail: 'font-weight: 400',
          previewChild: O1Text(
            'Manage your verifiable credentials, connect with trusted organizations, and maintain full sovereignty over your digital identity across multiple blockchain networks.',
            style: O1TextStyle.bodyMedium,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          code: 'class="text-body-regular text-text-primary"',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Body Small',
          description: 'Used for secondary information and metadata',
          spec: '12px / Regular',
          detail: 'font-weight: 400',
          previewChild: O1Text(
            'Last updated 2 hours ago • Verified by trusted issuer • Expires in 30 days',
            style: O1TextStyle.bodySmall,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          code: 'class="text-body-small text-text-secondary"',
        ),
      ],
    );
  }

  Widget _buildUtilityTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Utility Text',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Caption',
          description: 'Used for labels, timestamps, and fine print',
          spec: '10px / Medium',
          detail: 'font-weight: 500',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CREDENTIAL TYPE',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Updated 5 minutes ago',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
          code: 'class="text-caption text-text-secondary"',
        ),
      ],
    );
  }

  Widget _buildColorUsageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Color Usage',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        _buildColorShowcaseCard(
          title: 'Text Primary',
          description: 'Main content and headings',
          textColor: O1SemanticColors.textPrimary,
          hexCode: '#0F172A',
          exampleTitle: 'Digital Identity Verified',
          exampleBody:
              'Your identity credentials have been successfully verified and are ready to use.',
        ),
        const SizedBox(height: 24),
        _buildColorShowcaseCard(
          title: 'Text Secondary',
          description: 'Supporting text and descriptions',
          textColor: O1SemanticColors.textSecondary,
          hexCode: '#475569',
          exampleTitle: 'University Degree',
          exampleBody:
              'Issued by Stanford University on March 15, 2024. This credential verifies your completion of Computer Science degree.',
        ),
        const SizedBox(height: 24),
        _buildColorShowcaseCard(
          title: 'Text Disabled',
          description: 'Inactive or disabled text states',
          textColor: O1SemanticColors.textDisabled,
          hexCode: '#94A3B8',
          exampleTitle: 'Expired Credential',
          exampleBody:
              'This credential has expired and is no longer valid for verification purposes.',
        ),
      ],
    );
  }

  Widget _buildColorShowcaseCard({
    required String title,
    required String description,
    required Color textColor,
    required String hexCode,
    required String exampleTitle,
    required String exampleBody,
  }) {
    return ShowcaseCard(
      title: title,
      description: description,
      spec: hexCode,
      previewChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: textColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                hexCode,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            exampleTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            exampleBody,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      ),
      code: 'class="text-$title"',
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
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1Text(
                'Credential Card Example',
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
                          'VERIFIED CREDENTIAL',
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
                      'Professional Certificate',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Blockchain Development Certification issued by MIT',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ISSUED',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Mar 15, 2024',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EXPIRES',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Mar 15, 2027',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
