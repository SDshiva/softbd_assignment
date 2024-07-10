import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_assignment/Screen/home_screen.dart';
import 'package:soft_bd_assignment/provider/navigation_provider.dart';
import 'package:soft_bd_assignment/provider/progress_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ProgressModelProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(color: Colors.white),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
