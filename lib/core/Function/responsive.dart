import 'package:flutter/material.dart';

/// Utility class for responsive design
/// 
/// Provides methods to determine device type and get responsive values
class Responsive {
  /// Checks if the device is a mobile phone
  /// 
  /// [context] - Build context to get screen size
  /// 
  /// Returns true if screen width is less than 600px
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  /// Checks if the device is a tablet
  /// 
  /// [context] - Build context to get screen size
  /// 
  /// Returns true if screen width is between 600px and 1200px
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1200;
  }

  /// Checks if the device is a desktop
  /// 
  /// [context] - Build context to get screen size
  /// 
  /// Returns true if screen width is 1200px or more
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  /// Gets responsive width based on device type
  /// 
  /// [context] - Build context
  /// [mobile] - Width for mobile devices
  /// [tablet] - Width for tablet devices (optional)
  /// [desktop] - Width for desktop devices (optional)
  /// 
  /// Returns appropriate width based on device type
  static double getWidth(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }

  /// Gets responsive height based on device type
  /// 
  /// [context] - Build context
  /// [mobile] - Height for mobile devices
  /// [tablet] - Height for tablet devices (optional)
  /// [desktop] - Height for desktop devices (optional)
  /// 
  /// Returns appropriate height based on device type
  static double getHeight(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }

  /// Gets responsive font size based on device type
  /// 
  /// [context] - Build context
  /// [mobile] - Font size for mobile devices
  /// [tablet] - Font size for tablet devices (optional)
  /// [desktop] - Font size for desktop devices (optional)
  /// 
  /// Returns appropriate font size based on device type
  static double getFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }

  /// Gets responsive padding based on device type
  /// 
  /// [context] - Build context
  /// [mobile] - Padding for mobile devices
  /// [tablet] - Padding for tablet devices (optional)
  /// [desktop] - Padding for desktop devices (optional)
  /// 
  /// Returns appropriate padding based on device type
  static EdgeInsets getPadding(
    BuildContext context, {
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }

  /// Gets screen width
  /// 
  /// [context] - Build context
  /// 
  /// Returns the width of the screen
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Gets screen height
  /// 
  /// [context] - Build context
  /// 
  /// Returns the height of the screen
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

