import 'package:flutter/material.dart';
import 'package:ds_o1/ds_o1.dart';
import 'shared/showcase_widgets.dart';

class InputShowcaseScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const InputShowcaseScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<InputShowcaseScreen> createState() => _InputShowcaseScreenState();
}

class _InputShowcaseScreenState extends State<InputShowcaseScreen> {
  String _selectedSection = 'Input Variants';
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Input System'),
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
                        'Input System',
                        style: O1TextStyle.titleLarge,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(height: 44),
                      // Navigation Items
                      ShowcaseNavItem(
                        title: 'Input Variants',
                        isSelected: _selectedSection == 'Input Variants',
                        onTap: () =>
                            setState(() => _selectedSection = 'Input Variants'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'States',
                        isSelected: _selectedSection == 'States',
                        onTap: () => setState(() => _selectedSection = 'States'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Suffix Options',
                        isSelected: _selectedSection == 'Suffix Options',
                        onTap: () =>
                            setState(() => _selectedSection = 'Suffix Options'),
                      ),
                      const SizedBox(height: 8),
                      ShowcaseNavItem(
                        title: 'Special Inputs',
                        isSelected: _selectedSection == 'Special Inputs',
                        onTap: () =>
                            setState(() => _selectedSection = 'Special Inputs'),
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
                        title: 'OTP Input',
                        isSelected: _selectedSection == 'OTP Input',
                        onTap: () =>
                            setState(() => _selectedSection = 'OTP Input'),
                      ),
                      const SizedBox(height: 44),
                      // Quick Reference Card
                      QuickReferenceCard(
                        items: const [
                          QuickRefItem(title: 'Border', spec: '1px solid'),
                          QuickRefItem(title: 'Border Radius', spec: '8px'),
                          QuickRefItem(title: 'Min Height', spec: '48px'),
                          QuickRefItem(title: 'Padding', spec: '12px 16px'),
                          QuickRefItem(title: 'Font Size', spec: '16px'),
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
                      'Input System',
                      style: O1TextStyle.displayLarge,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'A comprehensive input system designed for consistent data entry across the OnlyOne Wallet application. Built with accessibility and usability in mind.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 75),
                    // Input Variants Section
                    _buildInputVariantsSection(),
                    const SizedBox(height: 75),
                    // Input States Section
                    _buildInputStatesSection(),
                    const SizedBox(height: 75),
                    // Suffix Options Section
                    _buildSuffixOptionsSection(),
                    const SizedBox(height: 75),
                    // Special Inputs Section
                    _buildSpecialInputsSection(),
                    const SizedBox(height: 75),
                    // Usage Examples Section
                    _buildUsageExamplesSection(),
                    const SizedBox(height: 75),
                    // OTP Input Section
                    _buildOtpInputSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Input Variants',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Basic Input',
          description: 'Standard text input with label and placeholder',
          spec: 'Height: 48px',
          detail: 'Border: 1px',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Full Name',
                placeholder: 'Enter your full name',
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Full Name\',\n  placeholder: \'Enter your full name\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'With Helper Text',
          description: 'Input with additional context below',
          spec: 'Helper: Gray 600',
          detail: 'Font: 12px',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Username',
                placeholder: 'Choose a username',
                helperText: 'Username must be 3-20 characters long',
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Username\',\n  placeholder: \'Choose a username\',\n  helperText: \'Username must be 3-20 characters long\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'With Prefix Icon',
          description: 'Input with icon and tooltip on the left side',
          spec: 'Icon: 20px',
          detail: 'With Tooltip',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Email Address',
                placeholder: 'name@example.com',
                prefix: O1TextFieldPrefix.iconWithTooltip(
                  icon: Icons.email_outlined,
                  tooltip: 'Enter your email address',
                ),
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Email Address\',\n  prefix: O1TextFieldPrefix.iconWithTooltip(\n    icon: Icons.email_outlined,\n    tooltip: \'Enter your email\',\n  ),\n)',
        ),
      ],
    );
  }

  Widget _buildInputStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Input States',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Default State',
          description: 'Normal enabled input ready for user interaction',
          spec: 'Border: Gray 300',
          detail: 'Focus: Primary',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Address',
                placeholder: 'Enter your address',
              ),
            ],
          ),
          code: 'O1TextField(\n  label: \'Address\',\n  enabled: true,\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Disabled State',
          description: 'Input that cannot be interacted with',
          spec: 'Opacity: 0.5',
          detail: 'Cursor: not-allowed',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Verified Email',
                placeholder: 'user@verified.com',
                enabled: false,
              ),
            ],
          ),
          code: 'O1TextField(\n  label: \'Verified Email\',\n  enabled: false,\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Read-Only State',
          description: 'Input that displays data but cannot be edited',
          spec: 'Background: Gray 50',
          detail: 'Editable: false',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Account ID',
                placeholder: '0x1234...5678',
                readOnly: true,
              ),
            ],
          ),
          code: 'O1TextField(\n  label: \'Account ID\',\n  readOnly: true,\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Disabled with Helper',
          description: 'Disabled input with explanation text',
          spec: 'Opacity: 0.5',
          detail: 'Helper: Gray 400',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Account ID',
                placeholder: 'did:onlyone:123456789',
                enabled: false,
                helperText: 'This field cannot be modified',
                controller: TextEditingController(text: 'did:onlyone:123456789'),
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Account ID\',\n  enabled: false,\n  helperText: \'This field cannot be modified\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Error State',
          description: 'Input showing validation error',
          spec: 'Border: Error',
          detail: 'Text: Error 600',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Email',
                placeholder: 'invalid-email',
                errorText: 'Please enter a valid email address',
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Email\',\n  errorText: \'Please enter a valid email address\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Required Field',
          description: 'Input with required indicator (red asterisk)',
          spec: 'Indicator: Red 600',
          detail: 'Label: 12px',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Email Address',
                placeholder: 'Enter your email',
                required: true,
              ),
            ],
          ),
          code: 'O1TextField(\n  label: \'Email Address\',\n  required: true,\n)',
        ),
      ],
    );
  }

  Widget _buildSuffixOptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Suffix Options',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'With Icon Button Suffix',
          description: 'Input with a clickable icon button on the right',
          spec: 'Icon: 20px',
          detail: 'Interactive',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Phone Number',
                placeholder: '+1 (555) 000-0000',
                suffix: O1TextFieldSuffix.iconButton(
                  icon: Icons.phone,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Phone Number\',\n  suffix: O1TextFieldSuffix.iconButton(\n    icon: Icons.phone,\n    onPressed: () {},\n  ),\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'With Button Suffix',
          description: 'Input with a text button on the right',
          spec: 'Button: Text',
          detail: 'Padding: 8px',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Search Query',
                placeholder: 'Search credentials...',
                controller: _searchController,
                suffix: O1TextFieldSuffix.button(
                  text: 'Clear',
                  onPressed: () => _searchController.clear(),
                ),
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Search Query\',\n  controller: controller,\n  suffix: O1TextFieldSuffix.button(\n    text: \'Clear\',\n    onPressed: () => controller.clear(),\n  ),\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'With Icon Button Suffix',
          description: 'Input with an icon button for actions',
          spec: 'Button: Icon',
          detail: 'Size: 24px',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Password',
                placeholder: 'Enter your password',
                obscureText: _obscurePassword,
                suffix: O1TextFieldSuffix.iconButton(
                  icon: _obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Password\',\n  obscureText: obscurePassword,\n  suffix: O1TextFieldSuffix.iconButton(\n    icon: obscurePassword ? Icons.visibility : Icons.visibility_off,\n    onPressed: () => togglePassword(),\n  ),\n)',
        ),
      ],
    );
  }

  Widget _buildSpecialInputsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'Special Inputs',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Password Input',
          description: 'Secure text input for passwords',
          spec: 'Obscured: true',
          detail: 'Toggle: visibility',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Password',
                placeholder: 'Enter password',
                obscureText: true,
                suffix: O1TextFieldSuffix.iconButton(
                  icon: Icons.visibility,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Password\',\n  obscureText: true,\n  suffix: O1TextFieldSuffix.iconButton(\n    icon: Icons.visibility,\n    onPressed: () => toggleVisibility(),\n  ),\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Multiline Input',
          description: 'Text area for longer text content',
          spec: 'Lines: 4',
          detail: 'Expandable',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Description',
                placeholder: 'Enter a detailed description...',
                maxLines: 4,
                minLines: 4,
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Description\',\n  maxLines: 4,\n  minLines: 4,\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'With Character Limit',
          description: 'Input with maximum character count',
          spec: 'Max: 100',
          detail: 'Counter: visible',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1TextField(
                label: 'Bio',
                placeholder: 'Write a short bio...',
                maxLength: 100,
                helperText: 'Keep it short and sweet',
              ),
            ],
          ),
          code:
              'O1TextField(\n  label: \'Bio\',\n  maxLength: 100,\n  helperText: \'Keep it short and sweet\',\n)',
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
                  'Login Form Example',
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
                        O1TextField(
                          label: 'Email Address',
                          placeholder: 'name@example.com',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefix: O1TextFieldPrefix.iconWithTooltip(
                            icon: Icons.email_outlined,
                            tooltip: 'Enter your email address',
                          ),
                        ),
                        const SizedBox(height: 16),
                        O1TextField(
                          label: 'Password',
                          placeholder: 'Enter your password',
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          prefix: O1TextFieldPrefix.iconWithTooltip(
                            icon: Icons.lock_outline,
                            tooltip: 'Enter your password',
                          ),
                          suffix: O1TextFieldSuffix.iconButton(
                            icon: _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onPressed: () => setState(
                                () => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        const SizedBox(height: 24),
                        O1Button(
                          text: 'Sign In',
                          onPressed: () {},
                          type: O1ButtonType.primary,
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

  Widget _buildOtpInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        O1Text(
          'OTP Input',
          style: O1TextStyle.headlineMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: '6-Digit OTP',
          description: 'Standard OTP input for verification codes',
          spec: 'Length: 6',
          detail: 'Auto-focus',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1OtpInput(
                length: 6,
                label: 'Verification Code',
                helperText: 'Enter the 6-digit code sent to your email',
                onCompleted: (code) {
                  print('OTP completed: $code');
                },
                onChanged: (value) {
                  print('OTP changed: $value');
                },
              ),
            ],
          ),
          code:
              'O1OtpInput(\n  length: 6,\n  label: \'Verification Code\',\n  helperText: \'Enter the 6-digit code\',\n  onCompleted: (code) {\n    verifyCode(code);\n  },\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: '4-Digit PIN',
          description: 'Shorter OTP input for PIN codes',
          spec: 'Length: 4',
          detail: 'Obscured',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1OtpInput(
                length: 4,
                label: 'PIN Code',
                helperText: 'Enter your 4-digit PIN',
                obscureText: true,
                onCompleted: (code) {
                  print('PIN completed: $code');
                },
              ),
            ],
          ),
          code:
              'O1OtpInput(\n  length: 4,\n  label: \'PIN Code\',\n  obscureText: true,\n  onCompleted: (code) {\n    verifyPin(code);\n  },\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'OTP with Error',
          description: 'OTP input showing error state',
          spec: 'State: Error',
          detail: 'Red border',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1OtpInput(
                length: 6,
                label: 'Verification Code',
                hasError: true,
                errorText: 'Invalid code. Please try again.',
                onCompleted: (code) {
                  print('OTP completed: $code');
                },
              ),
            ],
          ),
          code:
              'O1OtpInput(\n  length: 6,\n  hasError: true,\n  errorText: \'Invalid code. Please try again.\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Required OTP',
          description: 'OTP input marked as required',
          spec: 'Required: true',
          detail: 'Red asterisk',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1OtpInput(
                length: 6,
                label: '2FA Code',
                required: true,
                helperText: 'Use your authenticator app',
                onCompleted: (code) {
                  print('2FA code: $code');
                },
              ),
            ],
          ),
          code:
              'O1OtpInput(\n  length: 6,\n  label: \'2FA Code\',\n  required: true,\n  helperText: \'Use your authenticator app\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: 'Disabled OTP',
          description: 'OTP input in disabled state',
          spec: 'Enabled: false',
          detail: 'Opacity: 0.5',
          previewChild: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1OtpInput(
                length: 6,
                label: 'Verification Code',
                enabled: false,
                helperText: 'Code already verified',
              ),
            ],
          ),
          code:
              'O1OtpInput(\n  length: 6,\n  enabled: false,\n  helperText: \'Code already verified\',\n)',
        ),
        const SizedBox(height: 24),
        ShowcaseCard(
          title: '5-Digit Custom',
          description: 'Custom length OTP input',
          spec: 'Length: 5',
          detail: 'Alphanumeric',
          previewChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              O1OtpInput(
                length: 5,
                label: 'Promo Code',
                helperText: 'Enter the 5-character code',
                keyboardType: TextInputType.text,
                onCompleted: (code) {
                  print('Promo code: $code');
                },
              ),
            ],
          ),
          code:
              'O1OtpInput(\n  length: 5,\n  label: \'Promo Code\',\n  keyboardType: TextInputType.text,\n  onCompleted: (code) {\n    applyPromoCode(code);\n  },\n)',
        ),
      ],
    );
  }
}
