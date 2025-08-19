import 'package:flutter/material.dart';
import 'package:flux_store/Screens/chekOut/payment_page.dart';
import 'package:flux_store/utils/app_colors.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';

import '../../cusrom_widgets/custem_button.dart';

class CheckOutPage extends StatelessWidget {
  final String price;
   CheckOutPage({super.key, required this.price});

  final fistnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final streetnameController = TextEditingController();
   final countryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipcodeController = TextEditingController();
  final numberController = TextEditingController();
  final _couponController = TextEditingController();

  RxInt _selectedShippingMethod = 0.obs; // Default selected index for radio button
  RxBool _copyAddress = false.obs; // For the "Copy address from shipping" checkbox

   bool validateFields() {
     return fistnameController.text.trim().isNotEmpty &&
         lastnameController.text.trim().isNotEmpty &&
         countryController.text.trim().isNotEmpty &&
         streetnameController.text.trim().isNotEmpty &&
         cityController.text.trim().isNotEmpty &&
         stateController.text.trim().isNotEmpty &&
         zipcodeController.text.trim().isNotEmpty &&
         numberController.text.trim().isNotEmpty &&
         _copyAddress.value == true;
   }

   


   List<String> topCountries = [
     'United States', 'India', 'China', 'Brazil', 'Russia',
     'United Kingdom', 'Germany', 'France', 'Japan', 'Canada',
     'Australia', 'Italy', 'Mexico', 'South Korea', 'Spain',
   ];

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
  return Scaffold(
      appBar: AppBar(
        title: Text('Check out', style: AppTextStyles.heading2,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.location_on, color: AppColors.black, size: 30,),
                  Icon(Icons.credit_card, color: AppColors.secondaryTextColor,
                    size: 30,),
                  Icon(Icons.check_circle_rounded,
                    color: AppColors.secondaryTextColor, size: 30,),
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('step1', style: AppTextStyles.bodyText,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Shipping', style: AppTextStyles.heading1,),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              TextField(
                controller: fistnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'First name*',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: lastnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Last name*',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: countryController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Country*',
                  suffixIcon: Icon(Icons.arrow_drop_down, size: 35,),
                ),
    onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: topCountries.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(topCountries[index]),
                onTap: () {
                  countryController.text = topCountries[index];
                  Navigator.pop(context); // ✅ close sheet
                },
              );
            },
          );
        },
      );
    }
              ),
              SizedBox(height: 15,),
              TextField(
                controller: streetnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Street name*',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: cityController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'City*',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: stateController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'State/province*',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: zipcodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Zip-code*',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phone number*',
                ),
              ),
              SizedBox(height: 15,),

              Text('Shipping method', style: AppTextStyles.heading1,),
              SizedBox(height: 25,),


              // Free Shipping Radio
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return RadioListTile(
                      value: 0,
                      groupValue: _selectedShippingMethod.value,
                        activeColor: Colors.green,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        visualDensity: VisualDensity.comfortable,
                      onChanged: (int? newValue) {
                        _selectedShippingMethod.value = newValue!;
                      },
                      title: Text('Free Delivery to home'),
                      subtitle: Text('Delivery from 3 to 7 business days'),
                    );
                  }),
                  SizedBox(height: 20,),
                  Obx(() {
                    return RadioListTile(
                      value: 1,
                      groupValue: _selectedShippingMethod.value,
                      onChanged: (int? newValue) {
                        _selectedShippingMethod.value = newValue!;
                      },
                      title: Text('\$9.90 Delivery to home'),
                      subtitle: Text('Delivery from 4 to 6 business days'),
                    );
                  }),
                  // SizedBox(height: 20,),
                  // Obx(() {
                  //   return // Paid delivery option with radio button
                  //     Row(
                  //       children: [
                  //         Radio<int>(
                  //           value: 1,
                  //           groupValue: _selectedShippingMethod.value,
                  //           onChanged: (value) {
                  //             _selectedShippingMethod.value = value!;
                  //           },
                  //         ),
                  //         Column(
                  //           children: [
                  //
                  //             Text(),
                  //           ],
                  //         ),
                  //       ],
                  //     );
                  // }),
                  SizedBox(height: 20,),
                  Obx(() {
                    return RadioListTile(
                      value: 2,
                      groupValue: _selectedShippingMethod.value,
                      onChanged: (int? newValue) {
                        _selectedShippingMethod.value = newValue!;
                      },
                      title: Text('\$9.90 Delivery to home'),
                      subtitle: Text('Delivery from 2 to 3 business days'),
                    );
                  }),
                  // Obx(() {
                  //   // Fast delivery option with radio button
                  //   return Row(
                  //     children: [
                  //       Radio<int>(
                  //         value: 2,
                  //         groupValue: _selectedShippingMethod.value,
                  //         onChanged: (value) {
                  //           _selectedShippingMethod.value = value!;
                  //         },
                  //       ),
                  //       Column(
                  //         children: [
                  //           Text('\$9.90 Fast Delivery'),
                  //
                  //           Text('Delivery from 2 to 3 business days'),
                  //         ],
                  //       ),
                  //     ],
                  //   );
                  // }),
                ],
              ),
              SizedBox(height: 20,),
              Text('Coupon Code', style: AppTextStyles.heading1,),
              SizedBox(height: 20,),
              Column(
                children: [


                  Container(
                    height: 70,width: double.infinity,
                    padding: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,width: w*0.70,
                          child: TextField(
                            controller: _couponController,
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Have a code? Type it here...',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            print(_couponController);
                          },
                          child: Text('Validate',style: TextStyle(
                            color: Colors.green,
                          ),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),


                  // billing address section
                  Text(
                    'Billing Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),


                  Obx(() {
                    return Row(
                      children: [
                        Checkbox(
                          value: _copyAddress.value,
                          onChanged: (bool? newValue) {
                            _copyAddress.value = newValue!;
                          },
                        ),
                        Text('Copy address data from shipping'),
                      ],
                    );
                  }),
                  SizedBox(height: 20),

                  InkWell(
                      onTap: (){
                        if(validateFields()){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentPage(price:price)));
                        }else{
                         ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text('Please fill all required fields and check the billing address box.'),
                               backgroundColor: Colors.red,
                             )
                         );
                        }
                      },
                      child: CustemButton(text:'Continue to payment' ,))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
