# O1 Design System Examples

Esta carpeta contiene ejemplos de uso del O1 Design System.

## Estructura

- `main.dart`: Aplicación principal con navegación entre showcases
- `typography_showcase_screen.dart`: Showcase del sistema de tipografía
- `button_showcase_screen.dart`: Showcase del sistema de botones

## Ejecutar los ejemplos

Desde la carpeta raíz del proyecto:

```bash
flutter run -t examples/main.dart
```

O desde tu IDE:
1. Abre el archivo `examples/main.dart`
2. Presiona el botón de "Run" o "Debug"

## Showcases Disponibles

### Typography System

Una aplicación que muestra el sistema de tipografía completo del O1 Design System.

**Características:**
- **Jerarquía de Tipografía**: Large, Medium y Small Headings
- **Texto de Cuerpo**: Body Large, Regular y Small
- **Texto de Utilidad**: Caption styles
- **Uso de Colores**: Ejemplos de text-primary, text-secondary y text-disabled
- **Ejemplos de Uso**: Card de credencial verificada con gradiente

**Navegación:**
La aplicación incluye una barra lateral de navegación con:
- Hierarchy
- Body Text
- Utility Text
- Usage Examples
- Color Usage

Y una tarjeta de "Quick Reference" con los estilos más comunes.

### Button System

Una aplicación que muestra el sistema de botones completo del O1 Design System.

**Características:**
- **Variantes de Botones**: Primary, Secondary y Text buttons
- **Estados**: Default, Hover, Focus, Active, Disabled
- **Tamaños**: Large (56px), Default (48px), Small (32px)
- **Ejemplos de Uso**: Acciones de gestión de credenciales

**Navegación:**
La aplicación incluye una barra lateral de navegación con:
- Button Variants
- States
- Sizing
- Usage Guidelines
- Code Examples

Y una tarjeta de "Quick Reference" con las especificaciones principales.

## Home Screen

La pantalla principal proporciona navegación entre los diferentes showcases del design system:
- **Typography System**: Explora estilos de texto, jerarquía y guías de uso
- **Button System**: Descubre variantes de botones, estados y opciones de tamaño

## Características Compartidas

Todos los showcases:
- Están construidos completamente usando componentes del O1 Design System
- Siguen las especificaciones exactas del diseño en Figma
- Incluyen ejemplos de código CSS para referencia
- Tienen navegación lateral para acceso rápido a secciones
- Utilizan la paleta de colores semánticos del design system

## Próximos Showcases

- Input System (text fields, search bars)
- Card Components
- Icon System
- Color Tokens
- Spacing System
