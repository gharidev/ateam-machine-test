import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import './providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsProvider(),
      child: MaterialApp(
        title: 'ATeam Machine Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
          backgroundColor: Colors.grey.shade200,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
