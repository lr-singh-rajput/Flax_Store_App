import 'package:flutter/material.dart';
import 'package:flux_store/Screens/auth/login_page.dart';
import 'package:flux_store/Screens/home/home_screen.dart';
import 'package:flux_store/controllers/auth_controller.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});


  RxBool isPassHidden = true.obs;
  RxBool isRePassHidden = true.obs;
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController Re_pass = TextEditingController();

    AuthController authController = Get.put(AuthController());




    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create", style: AppTextStyles.heading1,),
                SizedBox(height: 8,),
                Text("Your account", style: AppTextStyles.heading1,),

                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                  ),
                ),
                SizedBox(height: 20,),
                Obx(() {
                  return TextFormField(
                    controller: pass,
                    obscureText: isPassHidden.value,
                    onTap: (){
                      isPassHidden.value = !isPassHidden.value;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(isPassHidden.value ? Icons.visibility_off : Icons.visibility),

                      labelText: "Password",
                    ),
                  );
                }),
                SizedBox(height: 20,),
                Obx(() {
                  return TextFormField(
                    onTap: (){
                      isRePassHidden.value = !isRePassHidden.value;
                    },
                    obscureText: isRePassHidden.value,
                    controller: Re_pass,
                    decoration: InputDecoration(
                      suffixIcon: Icon(isRePassHidden.value ? Icons.visibility_off : Icons.visibility),

                      labelText: "Conform Pass",
                    ),
                  );
                }),
                SizedBox(height: 20,),

                Center(
                  child: ElevatedButton(onPressed: () {
                    if (name.text.isNotEmpty && email.text.isNotEmpty &&
                        pass.text.isNotEmpty && Re_pass.text.isNotEmpty) {

                      authController.setLoginStatus(true);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill all required fields.'),
                            backgroundColor: Colors.red,
                          )
                      );
                    }
                  },
                      child: Text("SINGH UP")),
                ),

                SizedBox(height: 25,),
                Center(child: Text("or sign Up with")),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.apple, size: 55,)
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.g_mobiledata, size: 55,)
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.facebook, size: 55,)
                    ),

                  ],
                ),

                SizedBox(height: 40,),
                Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      child: Text("Already have account? Log In",
                        style: AppTextStyles.bodyText,)),
                )

              ],
            ),
          )),
    );
  }
}
