import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skly_flash/repository/providers/cart_provider.dart';
import 'package:skly_flash/repository/screens/splash/splashscreen.dart'; // Import splash screen
import 'package:skly_flash/repository/screens/bottomnav/bottomnavscreen.dart';
import 'package:skly_flash/repository/providers/address_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      child: MaterialApp(
        title: 'Blinkit Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(), // Start with splash screen
        routes: {
          '/home': (context) => BottomNavScreen(initialIndex: 0), // Define route for home
        },
      ),
    );
  }
}