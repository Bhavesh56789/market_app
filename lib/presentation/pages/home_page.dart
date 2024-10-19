import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_app/presentation/controllers/bottom_nav_controller.dart';
import 'package:market_app/presentation/pages/crypto_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  final List<Widget> pages = [
    CryptoPage(),
    const Center(child: Text('Home Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              color: Colors.white,
              height: 0,
            ),
            BottomNavigationBar(
              currentIndex: bottomNavController.selectedIndex.value,
              onTap: bottomNavController.onItemTapped,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Crypto',
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.payment),
                  label: 'Payment',
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
