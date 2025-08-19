import 'package:flutter/material.dart';
import 'package:flux_store/Screens/auth/chenge_pass.dart';
import 'package:flux_store/cusrom_widgets/custem_button.dart';
import 'package:flux_store/utils/text_styles.dart';

class OtpCheckPage extends StatefulWidget {
  const OtpCheckPage({super.key});

  @override
  State<OtpCheckPage> createState() => _OtpCheckState();
}

class _OtpCheckState extends State<OtpCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                SizedBox(height: 40,),
                Text("Verification code",style: AppTextStyles.heading1,),
                Text("Please enter the verification code we sent to your email address",style: AppTextStyles.bodyText,),

                // otp field


                SizedBox(height: 30,),
                Text("Resend in time"),

              SizedBox(height: 20,),
                Center(
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> ChengePass()));
                      },
                      child: CustemButton(text: "SUBMIT")),
                ),
                SizedBox(height: 20,),
              ],
            ),
          )
      ),
    );
  }
}
