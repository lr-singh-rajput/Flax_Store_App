import 'package:flutter/material.dart';
import 'package:flux_store/Screens/home/home_screen.dart';
import 'package:flux_store/cusrom_widgets/custem_button.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';

class ChengePass extends StatelessWidget {
  const ChengePass({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();
    TextEditingController Re_pass = TextEditingController();

    RxBool isPassHidden = true.obs;
    RxBool isRePassHidden = true.obs;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.arrow_back_ios, size: 23,)),
                  ),
                ),
                SizedBox(height: 70,),
                Text("Create New Password", style: AppTextStyles.heading1,),
                SizedBox(height: 14,),
                Text("Your new password", style: AppTextStyles.heading2,),
                SizedBox(height: 60,),
                Obx(() {
                  return TextFormField(
                    controller: pass,
                    obscureText: isPassHidden.value,
                    onTap: (){
                      isPassHidden.value = !isPassHidden.value;
                    },
                    decoration: InputDecoration(

                      suffixIcon: Icon(isPassHidden.value ? Icons.visibility_off : Icons.visibility),
                      hintText: 'new password',

                    ),
                  );
                }),
                SizedBox(height: 30,),
                Obx(() {
                  return TextFormField(
                    controller: Re_pass,
                    obscureText: isRePassHidden.value,
                    onTap: (){
                      isRePassHidden.value =!isRePassHidden.value;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(isRePassHidden.value ? Icons.visibility_off : Icons.visibility),
                      hintText: 'Confirm password',
                    ),
                  );
                }),

                SizedBox(height: 100,),
                Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                      child: CustemButton(text: "Confirm",)),
                ),
              ],
            ),
          )
      ),
    );
  }
}
