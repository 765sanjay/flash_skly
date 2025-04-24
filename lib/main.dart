import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skly_flash/repository/providers/cart_provider.dart';
import 'package:skly_flash/repository/screens/bottomnav/bottomnavscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        title: 'Blinkit Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavScreen(),
      ),
    );
  }
}