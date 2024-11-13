import 'package:country_app/country_provider.dart';
import 'package:country_app/screens/AddCountryScreen.dart';
import 'package:country_app/screens/CountryDetailScreen.dart';
import 'package:country_app/screens/home_screen.dart';
import 'package:country_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope( // ProviderScope bao bọc toàn bộ ứng dụng
      child: MaterialApp(
        title: 'Country App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/countries': (context) => HomeScreen(),
          '/addCountry': (context) => AddCountryScreen(), // Định nghĩa màn hình thêm quốc gia
        },
      ),
    );
  }
}
