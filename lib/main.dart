import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tocktik/config/theme/app_theme.dart';
import 'package:tocktik/presentation/providers/discover_provider.dart';
import 'package:tocktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage()
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme(), //sirve para llamar a la clase AppTheme y poner el tema que queremos
       home: const DiscoverScreen(),
      ),
    );
  }
}