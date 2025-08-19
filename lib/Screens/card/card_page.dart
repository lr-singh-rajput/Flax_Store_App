import 'package:flutter/material.dart';
import 'package:flux_store/Screens/chekOut/check_out_page.dart';
import 'package:flux_store/cusrom_widgets/custem_button.dart';
import 'package:flux_store/utils/app_colors.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';

class CardPage extends StatelessWidget {

  final size;
  final String color;
  final Map<String, dynamic> items;

  CardPage(
      {super.key, required this.items, required this.size, required this.color});

  final RxInt count = 1.obs;

  int get totalPrice => count.value * int.parse(items['price'].toString());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    print(totalPrice);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart", style: AppTextStyles.heading1,),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Container(
                height: h * .45, width: w * 0.90,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(items['image'], fit: BoxFit.cover,)),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Text(items['name'], style: AppTextStyles.heading1,),
                        SizedBox(height: 20,),
                        Text('\$${items['price'].toString()}',
                          style: AppTextStyles.heading1,),
                        SizedBox(height: 10,),
                        Text(
                            'size ${size.toString()} | Color ${color
                                .toString()}')
                      ],
                    ),

                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Icon(Icons.check_box, color: Colors.green, size: 30,),
                        SizedBox(height: 37,),
                        Container(
                          height: 40, width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2, color: Colors.grey)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    if (count.value > 1) {
                                      count.value--;
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove, color: Colors.grey,
                                    size: 30,)),
                              Obx(() {
                                return Text(count.toString());
                              }),
                              InkWell(
                                  onTap: () {
                                    if (count.value < 7) {
                                      count.value++;
                                      print(totalPrice);
                                    }
                                  },
                                  child: Icon(
                                    Icons.add, color: Colors.grey, size: 30,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product price", style: AppTextStyles.bodyText1,),
                  Obx(() {
                    return Text(
                      '\$$totalPrice', style: AppTextStyles.bodyText1,);
                  }),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping", style: AppTextStyles.bodyText1,),
                  Text('Freeship', style: AppTextStyles.bodyText1,),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("subtotal", style: AppTextStyles.bodyText1,),
                  Obx(() {
                    return Text('\$$totalPrice', style: AppTextStyles.bodyText1,);
                  }),
                ],
              ),

              SizedBox(height: 30,),

              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CheckOutPage(price:totalPrice.toString())));
                  },
                  child: CustemButton(text: 'Proceed to checkout'))
            ],
          ),
        ),
      ),
    );
  }
}
