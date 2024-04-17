import 'package:flutter/material.dart';
import 'package:olx_app_firebase/controller/bottom_provider.dart';
import 'package:olx_app_firebase/view/productpage/widgets/widget_tab.dart';
import 'package:olx_app_firebase/view/home/home.dart';
import 'package:olx_app_firebase/view/settings/settings_page.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({Key? key});

  final List<Widget> screens = [
    HomeScreen(),
    MyProductTab(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WidgetProvider>(
        builder: (context, value, child) => screens[value.currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(Icons.home, 'ᴴᵒᵐᵉ', 0, context),
            _BottomNavItem(Icons.collections, 'ᴹʸ ᴾʳᵒᵈᵘᶜᵗˢ', 1, context),
            //  _BottomNavItem(Icons.favorite_outlined, 'ʷᶦˢʰˡᶦˢᵗ', 2, context),
            _BottomNavItem(Icons.settings, 'ˢᵉᵗᵗᶦⁿᵍˢ', 2, context),
          ],
        ),
      ),
    );
  }

  Widget _BottomNavItem(
      IconData icon, String label, int index, BuildContext context) {
    final bottomProvider = Provider.of<WidgetProvider>(context);
    final isSelected = bottomProvider.currentIndex == index;
    final color = isSelected ? Colors.green : Colors.black;

    return GestureDetector(
      onTap: () => bottomProvider.onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
