import 'package:app/layers/presentation/screens/home_page.dart';
import 'package:app/layers/presentation/screens/itineraries_page.dart';
import 'package:app/layers/presentation/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const ItinerariesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 4,
        shadowColor: Colors.grey[100],
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: Colors.redAccent,
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.local_shipping,
              color: Colors.white,
            ),
            icon: Icon(Icons.local_shipping_outlined),
            label: 'Roteiros',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
