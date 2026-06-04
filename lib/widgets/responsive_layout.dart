import 'package:flutter/material.dart';

/// Breakpoints matching common device sizes.
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width < Breakpoints.mobile;

  static bool isTablet(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= Breakpoints.mobile &&
      MediaQuery.of(ctx).size.width < Breakpoints.tablet;

  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= Breakpoints.tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoints.tablet) return desktop;
        if (constraints.maxWidth >= Breakpoints.mobile) {
          return tablet ?? desktop;
        }
        return mobile;
      },
    );
  }
}
