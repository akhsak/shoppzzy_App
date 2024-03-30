import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/bottom_provider.dart';
import 'package:olx_app_firebase/view/addpage/addpage.dart';
import 'package:olx_app_firebase/view/home/home_page.dart';
import 'package:olx_app_firebase/view/settings/settings_page.dart';
import 'package:olx_app_firebase/view/wishlist/wishlist_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  List screens = [
    const HomePage(),
    const AddPage(),
    const WishlistPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomProvider>(
          builder: (context, value, child) => screens[value.currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(17),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Consumer<BottomProvider>(
            builder: (context, value, child) => BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: value.onTap,
              backgroundColor: Color.fromARGB(255, 29, 0, 107),
              currentIndex: value.currentIndex,
              selectedItemColor: Color.fromARGB(255, 121, 122, 122),
              unselectedItemColor: const Color(0xFFCADCFC),
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(color: Colors.black54),
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  label: 'ᴴᵒᵐᵉ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    size: 25,
                  ),
                  label: 'ᴬᵈᵈⁱᵗᵉᵐˢ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outlined,
                    size: 25,
                  ),
                  label: 'ʷᶦˢʰˡᶦˢᵗ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  label: 'ˢᵉᵗᵗᶦⁿᵍˢ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
