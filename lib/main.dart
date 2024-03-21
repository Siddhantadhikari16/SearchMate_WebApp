import 'package:flutter/material.dart';
import 'package:search_mate/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SearchMate());
}

class SearchMate extends StatelessWidget {
  const SearchMate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


