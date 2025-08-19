import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flux_store/Screens/detailPage/Detail_page.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final String searchQuery;

  const SearchPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final RxList<Map<String, dynamic>> filteredList = <Map<String, dynamic>>[].obs;


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

    filteredList.value = productList.where((item) {
      final name = item['name'].toString().toLowerCase();
      return name.contains(searchQuery.toLowerCase());
    }).toList();


    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SafeArea(
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Container(
                        height: 60, width: 60,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.arrow_back_ios, size: 20,),
                          ),
                        )
                    ), SizedBox(width: 20,),

                    Text("Dresses", style: AppTextStyles.heading1,)
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Found', style: AppTextStyles.heading1,),
                          Text('152 Results', style: AppTextStyles.heading1,),
                        ],
                      ),
                      Container(
                        height: 40, width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 2, color: Colors.grey)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Filter", style: AppTextStyles.bodyText,),
                              Icon(Icons.arrow_drop_down, color: Colors.black,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                Expanded(
                    child: Obx(() {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.55,


                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailPage(item: item)));
                            },

                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 200, width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  20)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                20),
                                            child: Image.asset(
                                              item['image'], fit: BoxFit.cover,),
                                          ),
                                        ),
                                        Positioned(
                                            right: 8, top: 7,
                                            child: Container(
                                              height: 30, width: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                              ),
                                              child: Icon(
                                                Icons.favorite, color: Colors.red,
                                                size: 22,),
                                            )
                                        ),
                                      ],
                                    ),
                                    Text(item['name'],
                                      style: AppTextStyles.heading2,),
                                    Text('\$${item['price']}',
                                      style: AppTextStyles.heading1,),
                                    RatingBarIndicator(
                                      rating: item['rating'],
                                      itemBuilder: (context, index) =>
                                          Icon(Icons.star, color: Colors.amber),
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
                      );
                    })
                )

              ],
            )
        ),
      ),
    );
  }
}
