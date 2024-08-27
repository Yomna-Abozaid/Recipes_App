import 'package:flutter/material.dart';
import 'package:untitled32/services/api_servise.dart';

import 'recipes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await ApiService().getAllRecipes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: RecipesList()
    );
  }


}






