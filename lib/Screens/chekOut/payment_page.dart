import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../cusrom_widgets/custem_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_styles.dart';
import 'order_completed.dart';

class PaymentPage extends StatefulWidget {
  final String price;
  const PaymentPage({super.key, required this.price});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

 // late Razorpay _razorpay;
  RxBool _agree = false.obs;
 //
 //  @override
 //  void initState() {
 //    super.initState();
 //
 //    // Initialize Razorpay instance
 //    _razorpay = Razorpay();
 //
 //    // Set up event listeners
 //    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
 //    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
 //    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
 //  }
 //
 //  @override
 //  void dispose() {
 //    // Clear Razorpay instance
 //    _razorpay.clear();
 //    super.dispose();
 //  }
 //
 //   void openCheckout() {
 //    int amountInPaise = (double.parse(widget.price) * 100).toInt(); // Convert ₹ to paise
 //    var options = {
 //      'key': 'rzp_test_GcZZFDPP0jHtC4', // Replace with your Razorpay key
 //      'amount':amountInPaise, // Convert to the smallest unit, // Amount in smallest unit (e.g., paise, cents)
 //      'name': 'Flux Store',
 //      'description': 'Order Payment',
 //
 //      'prefill': {
 //        'contact': '1234567890',
 //        'email': 'test@example.com',
 //      },
 //      'external': {
 //        'wallets': ['paytm', 'phonepe'],
 //      }
 //    };
 //    try {
 //      _razorpay.open(options);
 //      print("open razorpay");
 //    } catch (e) {
 //      print("Error: $e");
 //    }
 //  }
 // // Payment success callback
 //  void _handlePaymentSuccess(PaymentSuccessResponse response) {
 //    ScaffoldMessenger.of(context).showSnackBar(
 //        SnackBar(content: Text("Payment Successful: ${response.paymentId}"))
 //    );
 //
 //    // Navigate to order completed page
 //    Navigator.push(context, MaterialPageRoute(builder: (_) => OrderCompleted()));
 //  }
 //
 //  // Payment error callback
 //  void _handlePaymentError(PaymentFailureResponse response) {
 //    ScaffoldMessenger.of(context).showSnackBar(
 //        SnackBar(content: Text("Payment Failed: ${response.message}"))
 //    );
 //  }
 //
 //  // External wallet callback
 //  void _handleExternalWallet(ExternalWalletResponse response) {
 //    ScaffoldMessenger.of(context).showSnackBar(
 //        SnackBar(content: Text("External Wallet Selected: ${response.walletName}"))
 //    );
 //  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Check out', style: AppTextStyles.heading2,),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.location_on, color: AppColors.black, size: 30,),
                  Icon(Icons.credit_card_sharp, color: AppColors.black,
                    size: 30,),
                  Icon(Icons.check_circle_rounded,
                    color: AppColors.secondaryTextColor, size: 30,),
                ],
              ),
              SizedBox(height: 15,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('step2', style: AppTextStyles.bodyText,),
                  ],
                ),

              SizedBox(height: 10,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Payment', style: AppTextStyles.heading1,),
                  ],
                ),
              SizedBox(height: 20,),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.credit_card,weight: 105,size: 50,color: AppColors.secondaryTextColor,),
                          Text('Card',style: AppTextStyles.bodyText1,)
                        ],
                      ),
                    ),


                    InkWell(
                      onTap: (){
                        if(_agree.value){
                  //       openCheckout();
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please agree to Terms and Conditions"))
                          );
                        }
                        // IS PAR CLICK PAR ROZARPAY SE PAYMENT HO ABHI KE LIYE DUMMI
                      },
                      child: Column(
                        children: [
                          Icon(Icons.more_horiz,weight: 105,size: 50,color: AppColors.secondaryTextColor,),
                          Text('RozarPay',style: AppTextStyles.bodyText1,)
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(Icons.money,weight: 105,size: 50,color: AppColors.secondaryTextColor,),
                        Text('Cash',style: AppTextStyles.bodyText1,)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product price",style: AppTextStyles.bodyText1,),
                  Text('\$ ${widget.price}',style: AppTextStyles.bodyText1,),
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping",style: AppTextStyles.bodyText1,),
                  Text('Freeship',style: AppTextStyles.bodyText1,),
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("subtotal",style: AppTextStyles.bodyText1,),
                  Text('\$${widget.price}',style: AppTextStyles.bodyText1,),
                ],
              ),

              SizedBox(height: 30,),

              SizedBox(height: 8),


              Obx(() {
                return Row(
                  children: [
                    Checkbox(
                      value: _agree.value,
                      onChanged: (bool? newValue) {
                        _agree.value = newValue!;
                      },
                      activeColor: Colors.green,

                    ),
                    Text('I agree to Tearm and conditions'),
                  ],
                );
              }),
              SizedBox(height: 20),

              // Place order button (optional if Razorpay is used)
              InkWell(
                onTap: () {
                  if (_agree.value) {
                 //   openCheckout();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => OrderCompleted()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please agree to Terms and Conditions"))
                    );
                  }
                },
                child: CustemButton(text: 'Place my order'),
              ),
              ],
        ),
        ),
      ),

    );
  }
}
