import 'package:flutter/material.dart';
import 'package:flux_store/cusrom_widgets/custem_button.dart';
import 'package:flux_store/utils/text_styles.dart';

import '../../utils/app_colors.dart';
import '../home/home_screen.dart';

class OrderCompleted extends StatelessWidget {
  const OrderCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check out', style: AppTextStyles.heading2,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.location_on, color: AppColors.black, size: 30,),
                  Icon(Icons.credit_card_sharp, color: AppColors.black,
                    size: 30,),
                  Icon(Icons.check_circle_rounded,
                    color: AppColors.black, size: 30,),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 68.0),
                    child: Text('step3', style: AppTextStyles.bodyText,),
                  ),
                ],
              ),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Order Completed', style: AppTextStyles.heading1,),
                ],
              ),
              SizedBox(height: 40,),
              Icon(Icons.shopping_bag_outlined,size: 250,),
              SizedBox(height: 10,),
              

              Text('Thank you for your purchase.',style: AppTextStyles.bodyText,),
              Text('You can view your order in ‘My Orders’ section.',style: AppTextStyles.bodyText,),

              SizedBox(height: 100,),
              InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false,
                    );
                  },
                  child: CustemButton(text: 'Continue shopping'))
            ],
          ),
        ),
      ),
    );
  }
}
