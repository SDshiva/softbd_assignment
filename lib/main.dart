import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:soft_bd_assignment/Screen/home_screen.dart';
import 'package:soft_bd_assignment/provider/api_calling_provider.dart';
import 'package:soft_bd_assignment/provider/date_time_provider.dart';
import 'package:soft_bd_assignment/provider/navigation_provider.dart';
import 'package:soft_bd_assignment/provider/progress_provider.dart';

Future<void> main() async {
  await initializeDateFormatting('bn_BD', null);
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
        ChangeNotifierProvider(create: (_) => DateTimeProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
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
