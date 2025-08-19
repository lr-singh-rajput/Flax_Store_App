import 'package:flutter/material.dart';
import 'package:flux_store/Screens/auth/login_page.dart';
import 'package:flux_store/controllers/auth_controller.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/themeController.dart';


class SidebarMenu extends StatelessWidget {
  final themeController = Get.put(ThemeController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 10,),
        Container(
          height: 250,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 👧 Circular Image
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/girl3.jpg'),
                ),
                SizedBox(width: 16), // 🧱 Space between image and text
                // 📝 Text Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'user@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),


        // Container(
        //   height: 250,
        //   child: Center(
        //     child: ListTile(
        //       leading: Container(
        //         height: 100,width: 70,
        //         child: ClipRRect(
        //             borderRadius: BorderRadius.circular(100),
        //             child: Image.asset('assets/images/girl3.jpg',fit: BoxFit.cover,)),
        //       ),
        //       title: Text('wellcome'),
        //       subtitle: Text("user@gmail.com"),
        //     ),
        //   ),
        // ),


        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text("Home Page"),
          onTap: () {
            Navigator.pop(context);
            // Navigate to Home
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text("Search Page"),
          onTap: () {
            Navigator.pop(context);
            // Navigate to Search
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag_outlined),
          title: Text("My Orders"),
          onTap: () {
            Navigator.pop(context);
            // Navigate to Orders
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("My Profile"),
          onTap: () {
            Navigator.pop(context);
            // Navigate to Profile
          },
        ),

        Divider(),
        // 🔻 Other Section

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Others', style: AppTextStyles.bodyText,),
        ),
        ListTile(
          leading: Icon(Icons.settings_outlined),
          title: Text("Settings"),
          onTap: () {
            Navigator.pop(context);
            // Navigate to Settings
          },
        ),
        ListTile(
          leading: Icon(Icons.mail_outline),
          title: Text("Support"),
          onTap: () {
            Navigator.pop(context);
            // Navigate to Settings
          },
        ),

        ListTile(
          leading: Icon(Icons.report_gmailerrorred_outlined),
          title: Text("LogOut"),
          onTap: () {
            authController.setLoginStatus(false);
            Get.offAll(() => LoginPage());
            // Navigate to Settings
          },
        ),

        Spacer(),
        Obx(() {
          return SwitchListTile(
            title: Text('Light/Dark', style: TextStyle(
                color: themeController.isDark.value ? Colors.white : Colors
                    .black)),
            value: themeController.isDark.value,
            onChanged: (value) {
              themeController.toggleTheme();
            },
            secondary: Icon(
              themeController.isDark.value ? Icons.nightlight_round : Icons
                  .wb_sunny,
              color: themeController.isDark.value ? Colors.white : Colors.black,
            ),
          );
        }),

      ],
    );
  }
}
