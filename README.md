# Chesel - Master Component & Microcopy Blueprint

A cross-platform Flutter application implementing Swiss design principles for comprehensive lifestyle analysis and optimization.

## Features

- **Gender-based Onboarding**: Personalized experience based on user profile
- **Daily Protocol**: Mission-based task management system
- **Fitness Analysis**: Comprehensive physique assessment and goal tracking
- **Fashion Intelligence**: Outfit review, finder, and personal styling
- **Body Analysis**: Multi-category assessment (Face, Skin, Hair, Beard)
- **Presence Coaching**: Interactive communication skills development

## Design Philosophy

- **Swiss Design Aesthetic**: Clean, minimalist interface with abundant whitespace
- **Typography**: Libre Baskerville for body text, IM Fell English SC for brand name
- **High Contrast**: Black and white color scheme with strategic gray accents
- **Grid-based Layout**: Consistent spacing and alignment throughout
- **Card-based Interface**: Modular design for easy navigation and interaction

## Required Assets

To complete the implementation, please provide:

### Fonts
- `assets/fonts/LibreBaskerville-Regular.ttf`
- `assets/fonts/LibreBaskerville-Bold.ttf`
- `assets/fonts/LibreBaskerville-Italic.ttf`
- `assets/fonts/IMFellEnglishSC-Regular.ttf`

### Images
- App logo/icon (1024x1024px)
- Placeholder images for analysis modules
- Reference photos for fitness and fashion modules

### Animations
- Loading animations (Lottie or GIF format)
- Success/completion animations
- Transition effects

## Installation

1. Ensure Flutter SDK is installed
2. Clone the repository
3. Add required font files to `assets/fonts/`
4. Add required images to `assets/images/`
5. Run `flutter pub get`
6. Run `flutter run`

## Architecture

- **State Management**: Local state with SharedPreferences persistence
- **Navigation**: Bottom tab navigation with module-based screens
- **Data Storage**: JSON serialization with local storage
- **UI Components**: Custom reusable widgets following design system
- **Cross-platform**: Single codebase for iOS and Android

## Modules

1. **Home**: Daily Protocol with mission management
2. **Fitness**: Physique analysis and goal setting
3. **Fashion**: Outfit review and styling recommendations
4. **Body**: Multi-category appearance analysis
5. **Presence**: Interactive coaching and communication development

## Development Notes

- All text uses Libre Baskerville font family
- Brand name "Chesel" exclusively uses IM Fell English SC
- Consistent 24px padding throughout the application
- Card-based layout with 8px border radius
- Black primary color (#000000) for actions and emphasis
- Gray scale for secondary elements and backgrounds