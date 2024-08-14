import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class DevApp extends StatelessWidget {
  const DevApp({
    super.key,
    required this.routerConfig,
  });
  final RouterConfig<Object> routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'dev-hann',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      theme: FlexThemeData.light(),
      darkTheme: FlexThemeData.dark(),
      routerConfig: routerConfig,
    );
  }
}
