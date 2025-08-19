import 'package:flutter/material.dart';
import 'package:flux_store/Screens/auth/otp_check.dart';
import 'package:flux_store/utils/text_styles.dart';

import '../../cusrom_widgets/custem_button.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(

      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.arrow_back_ios,size: 23,)),
                  ),
                ),
                SizedBox(height: 80,),
                Text("Forget Password?",style: AppTextStyles.heading1,),
                SizedBox(height: 20,),
                Text("Enter email associated with your account and we’ll send and email with intructions to reset your password",style: AppTextStyles.bodyText,),
                SizedBox(height: 50,),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    suffixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(height: 70,),
                Center(
                  child: InkWell(
                              onTap: (){
                                if(email.text.isNotEmpty){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpCheckPage()));
                                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                              content: Text('Please fill all required fields.'),
                              backgroundColor: Colors.red,
                      )
                  );
                                }
                              },
                      child: CustemButton(text: "SUBMIT",)),
                )
              ],
            ),
          )
      ),
    );
  }
}
