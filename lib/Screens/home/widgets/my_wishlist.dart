import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flux_store/Screens/detailPage/Detail_page.dart';
import 'package:flux_store/utils/text_styles.dart';

import '../../../cusrom_widgets/SidebarMenu.dart';
import '../../../cusrom_widgets/app_bar.dart';

class MyWishlist extends StatelessWidget {
  const MyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productList = [
      {
        'image': 'assets/images/girl1.jpg',
        'name': 'Floral Print Top',
        'price': 20,
        'rating': 3.2,
        "totalReviews": 80,
      },

      {
        'image': 'assets/images/girl2.jpg',
        'name': 'Casual White Top',
        'price': 25,
        'rating': 3.8,
        "totalReviews": 70,
      },

      {
        'image': 'assets/images/girl3.jpg',
        'name': 'Sleeveless Summer Top',
        'price': 30,
        'rating': 4.5,
        "totalReviews": 65,
      },

      {
        'image': 'assets/images/girl4.jpg',
        'name': 'Denim Crop Top',
        'price': 35,
        'rating': 4.0,
        "totalReviews": 123,
      },

      {
        'image': 'assets/images/girl5.jpg',
        'name': 'Boho Style Top',
        'price': 40,
        'rating': 2.7,
        "totalReviews": 90,
      },

      {
        'image': 'assets/images/girl6.jpg',
        'name': 'Striped Casual Top',
        'price': 45,
        'rating': 3.9,
        "totalReviews": 180,
      },

      {
        'image': 'assets/images/girl7.jpg',
        'name': 'Elegant Black Top',
        'price': 50,
        'rating': 4.6,
        "totalReviews": 120,
      },

    ];


    return Scaffold(
        appBar: CustomAppBar(title: 'My Wishlist'),
        drawer: Drawer(
          child: SidebarMenu(), // ✅ Your custom sidebar widget
        ),
      body: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.56,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
        itemCount: productList.length,
        itemBuilder: (context,index){
            final item = productList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailPage(item: item)));
              },
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                            Container(
                              height: 200,width: 140,
                              child: Image.asset(item['image'],fit: BoxFit.cover,),
                            ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                  height: 30,width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Icon(Icons.favorite,size:22,color: Colors.red,))
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 40, // max height you want
                        width: 150,
                        child: Text(
                          item['name'],
                          style: AppTextStyles.bodyText1,
                          maxLines: 1, // restrict lines
                          overflow: TextOverflow.ellipsis, // show "..."
                        ),
                      ),

                      Text('\$ 52.00',style: AppTextStyles.heading1,),
                      RatingBarIndicator(
                        rating: item['rating'],
                        itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      Text('${item['rating']} rating'),

                    ],
                  ),
                ],
              ),
            );
        },
      )
    );
  }
}
