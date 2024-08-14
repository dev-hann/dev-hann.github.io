import 'package:blog/view/main_view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dev-hann',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.light,
      theme: FlexThemeData.light(),
      darkTheme: FlexThemeData.dark(),
      home: const MainView(),
    );
  }
}
