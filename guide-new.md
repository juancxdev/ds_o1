# Guía Completa para Crear un Sistema de Diseño con Atomic Design en Flutter

## 1. Creación del Package en Flutter

### Paso 1: Crear el package
```bash
flutter create --template=package ds_o1
cd ds_o1
```

### Paso 2: Configurar el pubspec.yaml
```yaml
name: ds_o1
description: Sistema de diseño O1 basado en Atomic Design Methodology
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.0.0"

dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 2. Prompt para Agente IA

Actúa como un experto en Flutter y Atomic Design Methodology. Necesito que crees un sistema de diseño completo siguiendo estas especificaciones:

**CONTEXTO:**
- Package name: ds_o1
- Metodología: Atomic Design (Atoms, Molecules, Organisms)
- Framework: Flutter
- Omitir Templates y Pages (sistema joven)


**ESTRUCTURA REQUERIDA:**
```
lib/
├── ds_o1.dart (archivo principal de exportación)
├── tokens/
│   ├── colors.dart
│   ├── typography.dart
│   ├── spacing.dart
│   └── borders.dart
├── foundations/
│   └── themes/
│       ├── o1_theme.dart
│       ├── light_theme.dart
│       ├── dark_theme.dart
│       └── theme_extensions.dart
├── atoms/
│   ├── buttons/
│   ├── inputs/
│   ├── icons/
│   └── texts/
├── molecules/
│   ├── cards/
│   ├── forms/
│   └── navigation/
└── organisms/
    ├── headers/
    ├── footers/
    └── sections/
```

**TOKENS DE DISEÑO ESPECÍFICOS:**

### Typography System (usando Google Fonts - Inter):
```dart
// Mapeo al TextTheme de Flutter
TextTheme get textTheme => GoogleFonts.interTextTheme().copyWith(
  displayLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: textPrimary),
  displayMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary),
  displaySmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
  headlineLarge: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: textPrimary),
  headlineMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary),
  headlineSmall: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
  titleLarge: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary),
  titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
  titleSmall: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500, color: textPrimary),
  bodyLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500, color: textPrimary),
  bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: textSecondary),
  bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal, color: textSecondary),
  labelLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
  labelMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal, color: textSecondary),
  labelSmall: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500, color: textDisabled),
);
```

### Color Tokens:
```dart
// Text Colors
static const Color textPrimary = Color(0xFF000000);    // #000000
static const Color textSecondary = Color(0xFF6B7280);  // #6B7280  
static const Color textDisabled = Color(0xFF9CA3AF);   // #9CA3AF

// Button Colors
static const Color primaryButton = Color(0xFF1F72FF);  // #1F72FF
static const Color buttonText = Colors.white;
static const Color buttonDisabled = Color(0xFF9CA3AF); // #9CA3AF

// Input Colors
static const Color inputBorderDefault = Color(0xFFE5E7EB);  // #E5E7EB
static const Color inputBorderFocus = Color(0xFF1F72FF);    // #1F72FF
static const Color inputBorderError = Color(0xFFEF4444);    // #EF4444
static const Color inputBackgroundDisabled = Color(0xFFF9FAFB); // #F9FAFB
static const Color inputTextFilled = Color(0xFF111827);     // #111827
```

### Button Sizing:
```dart
static const double buttonHeightLarge = 56.0;
static const double buttonHeightDefault = 48.0;
static const double buttonHeightSmall = 32.0;
```

**ESPECIFICACIONES CRÍTICAS DEL THEME:**

1. **Foundations/Themes**: 
   - `O1Theme` debe exponer `lightTheme` y `darkTheme` como ThemeData
   - Configurar COMPLETAMENTE el ThemeData incluyendo:

### ElevatedButtonTheme (Primary Button):
```dart
ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF1F72FF),
    foregroundColor: Colors.white,
    disabledBackgroundColor: Color(0xFF9CA3AF),
    disabledForegroundColor: Colors.white,
    overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.hovered)) return Colors.white.withOpacity(0.1);
      if (states.contains(MaterialState.focused)) return Colors.white.withOpacity(0.2);
      if (states.contains(MaterialState.pressed)) return Colors.white.withOpacity(0.3);
      return null;
    }),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 48)),
    textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
)
```

### OutlinedButtonTheme (Secondary Button):
```dart
OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: Color(0xFF1F72FF),
    backgroundColor: Colors.transparent,
    disabledForegroundColor: Color(0xFF9CA3AF),
    side: BorderSide(color: Color(0xFF1F72FF), width: 1),
    overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.hovered)) return Color(0xFF1F72FF).withOpacity(0.1);
      if (states.contains(MaterialState.focused)) return Color(0xFF1F72FF).withOpacity(0.2);
      if (states.contains(MaterialState.pressed)) return Color(0xFF1F72FF).withOpacity(0.3);
      return null;
    }),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 48)),
    textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
)
```

### TextButtonTheme (Text Button):
```dart
TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: Color(0xFF1F72FF),
    backgroundColor: Colors.transparent,
    disabledForegroundColor: Color(0xFF9CA3AF),
    overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.hovered)) return Color(0xFF1F72FF).withOpacity(0.1);
      if (states.contains(MaterialState.focused)) return Color(0xFF1F72FF).withOpacity(0.2);
      if (states.contains(MaterialState.pressed)) return Color(0xFF1F72FF).withOpacity(0.3);
      return null;
    }),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 48)),
    textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
)
```

### InputDecorationTheme:
```dart
InputDecorationTheme(
  // Default state
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xFFE5E7EB), width: 1),
  ),
  // Focus state
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xFF1F72FF), width: 1),
  ),
  // Error state
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xFFEF4444), width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xFFEF4444), width: 1),
  ),
  // Disabled state
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Color(0xFFE5E7EB), width: 1),
  ),
  fillColor: Color(0xFFF9FAFB),
  filled: true,
  labelStyle: GoogleFonts.inter(fontSize: 14, color: Color(0xFF374151)),
  hintStyle: GoogleFonts.inter(fontSize: 14, color: Color(0xFF9CA3AF)),
  errorStyle: GoogleFonts.inter(fontSize: 12, color: Color(0xFFEF4444)),
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
)
```

2. **Atoms**: Deben usar `Theme.of(context)` para obtener propiedades del theme, NO valores hardcodeados

**ATOMS ESPECÍFICOS A CREAR:**

### O1Button:
```dart
class O1Button extends StatelessWidget {
  final String text;                    // Texto del botón (requerido)
  final VoidCallback? onPressed;        // Función callback (null = disabled)
  final O1ButtonType type;              // Tipo: primary, secondary, text
  final O1ButtonSize size;              // Tamaño: large, medium, small
  final Widget? icon;                   // Icono opcional
  final bool isLoading;                 // Estado de carga
}

enum O1ButtonType { primary, secondary, text }
enum O1ButtonSize { large, medium, small }
```

### O1TextField:
```dart
class O1TextField extends StatelessWidget {
  final String? placeholder;           // Placeholder text
  final String? label;                // Label text
  final bool enabled;                 // true = enabled, false = disabled
  final bool readOnly;                // true = readonly, false = editable
  final O1TextFieldSuffix? suffix;    // Suffix flexible
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
}

class O1TextFieldSuffix {
  final Widget? widget;
  final VoidCallback? onTap;
  
  // Constructores específicos
  O1TextFieldSuffix.icon({required IconData icon, VoidCallback? onTap});
  O1TextFieldSuffix.button({required String text, required VoidCallback onPressed});
  O1TextFieldSuffix.iconButton({required IconData icon, required VoidCallback onPressed});
  O1TextFieldSuffix.custom({required Widget widget, VoidCallback? onTap});
}
```

3. **Convenciones de Naming**:
   - Clases: PascalCase con prefijo O1 (O1Button, O1TextField)
   - Archivos: snake_case
   - Constantes: camelCase con prefijo o1 (o1Primary, o1Spacing16)

4. **Archivo Principal (ds_o1.dart)**: Debe exportar TODO lo necesario organizadamente

**COMPONENTES MÍNIMOS A CREAR:**
- Atoms: O1Button, O1TextField, O1Text, O1Icon
- Molecules: O1Card, O1SearchBar
- Organisms: O1AppBar, O1NavigationBar

**REQUISITOS TÉCNICOS:**
- Todos los componentes deben ser StatelessWidget cuando sea posible
- Usar Theme.of(context) para acceder a propiedades del theme
- Documentación con /// para todos los componentes públicos
- Parámetros opcionales con valores por defecto sensatos
- Soporte completo para temas claro y oscuro
- IMPORTANTE: Todos los bordes deben tener grosor de 1px

Genera la estructura completa con código funcional y bien documentado.
```

## 3. Uso del Sistema de Diseño

### En el MaterialApp:
```dart
import 'package:ds_o1/ds_o1.dart';

MaterialApp(
  theme: O1Theme.lightTheme,
  darkTheme: O1Theme.darkTheme,
  themeMode: ThemeMode.system,
  home: MyApp(),
)
```

### En los componentes:
```dart
import 'package:ds_o1/ds_o1.dart';

// Botón simple
O1Button(
  text: 'Create Credential',
  onPressed: () {},
  type: O1ButtonType.primary,
)

// Input con suffix
O1TextField(
  label: 'Phone Number',
  placeholder: 'Enter your phone number',
  suffix: O1TextFieldSuffix.icon(
    icon: Icons.phone,
    onTap: () => print('Phone tapped'),
  ),
)
```

## 4. Validación del Sistema

El sistema estará correctamente implementado cuando:
- ✅ Los componentes cambien automáticamente entre tema claro y oscuro
- ✅ `Theme.of(context)` funcione en todos los atoms
- ✅ No haya valores hardcodeados en los componentes
- ✅ El ThemeData esté completamente configurado con todos los tokens específicos
- ✅ La estructura de carpetas siga Atomic Design
- ✅ Todos los exports funcionen desde `ds_o1.dart`
- ✅ Los botones tengan los 3 tipos y 3 tamaños especificados
- ✅ Los inputs manejen todos los estados y suffix flexibles
- ✅ Todos los bordes tengan grosor de 1px
- ✅ La tipografía use Inter de Google Fonts correctamente
