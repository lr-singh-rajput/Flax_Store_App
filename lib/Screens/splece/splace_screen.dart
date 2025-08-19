import 'package:flutter/material.dart';
import 'package:flux_store/Screens/home/home_screen.dart';
import 'package:flux_store/Screens/splece/intro_page.dart';
import 'package:flux_store/controllers/auth_controller.dart';
import 'package:flux_store/cusrom_widgets/custem_button.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});



  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}



class _SplaceScreenState extends State<SplaceScreen> {
  AuthController authController = Get.put(AuthController());

  _checkLoginStatus()async{

    bool isLogin = await authController.getLoginStatus();

    print("value of isLogin is => $isLogin");

    if(isLogin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => IntroPage()),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
      var h = MediaQuery.of(context).size.height; 
      var w = MediaQuery.of(context).size.width; 

    return Scaffold(
      body:Stack(
        children: [
           Container(
        height: double.infinity,
        width: double.infinity,
        child: Opacity(
          opacity: 1,
          child: Image.asset("assets/images/girl6.jpg",fit: BoxFit.cover, ),
          ),),
      
      Positioned(
        bottom: h*0.20,
            left: 0,  // Left side se
            right: 0, // Right side se
          
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to GemStore!',style: AppTextStyles.heading3),
          SizedBox(height: 10,),
          Text('The home for a fashionista',style: AppTextStyles.heading4,),
          SizedBox(height: 40,),
          InkWell(
              onTap: (){
                _checkLoginStatus();              },
              child: CustemButton(text: 'Get Started')),
        ],
      ),
        
      ),
        ],
      )
    );
  }
}