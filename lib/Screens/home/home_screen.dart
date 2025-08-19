import 'package:flutter/material.dart';
import 'package:flux_store/Screens/home/widgets/discover.dart';
import 'package:flux_store/Screens/home/widgets/home_page.dart';
import 'package:flux_store/Screens/home/widgets/my_order_page.dart';
import 'package:flux_store/Screens/home/widgets/my_wishlist.dart';
import 'package:flux_store/Screens/home/widgets/search_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  var _pages = [HomePage(), DiscoverPage(), MyOrdersScreen(), MyWishlist()];


  RxInt _selectedPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(()=> _pages[_selectedPage.value]),

      //bottom nav bar
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
          ],
          selectedItemColor: Colors.black,
          currentIndex: _selectedPage.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _selectedPage.value = index;
          },
        );
      }),
    );
  }
}
