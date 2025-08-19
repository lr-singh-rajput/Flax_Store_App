import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Standard AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.heading2,
      ),
     centerTitle: true,
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon:Icon(Icons.menu));
        }
      ),// No shadow
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.notifications_active_outlined,size: 28,),
        )
      ],
    );
  }
}