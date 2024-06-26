import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:repairing_lap_app/views/home.dart';
import 'package:repairing_lap_app/views/login.dart';
import 'package:repairing_lap_app/views/qrcode.dart';
import 'package:repairing_lap_app/views/register.dart';
import 'package:repairing_lap_app/views/setting.dart';
import 'package:repairing_lap_app/views/welcome.dart';
// import 'package:repairing_lap_app/data/languages.dart';

import 'data/languages.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: [
        GetPage(name: '/register', page: () => const RegisterView()),
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/welcome', page: () => const WelcomeView()),
        // Add other routes here
      ],
    );
  }
}

// Bottom navigation
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeView(),
    ScanQRCodeView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[100]!,
        buttonBackgroundColor: Colors.blue[100],
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: Colors.blue[400]!,
          ),
          Icon(
            Icons.qr_code,
            color: Colors.blue[400]!,
          ),
          Icon(
            Icons.settings,
            color: Colors.blue[400]!,
          ),
        ],
      ),
    );
  }
}
