import 'package:flutter/material.dart';
import 'package:flux_store/Screens/detailPage/Detail_page.dart';
import 'package:flux_store/utils/app_colors.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../cusrom_widgets/SidebarMenu.dart';
import '../../../cusrom_widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
          child: SidebarMenu(), // ✅ Your custom sidebar widget
        ),
      appBar: CustomAppBar(title: 'FlaxStore'),
     body : Padding(
       padding: const EdgeInsets.all(13.0),
       child: SingleChildScrollView(

         child: Column(
           children: [
             SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Custom_Column(text: "women",iconname: Icons.woman,),
                 Custom_Column(text: "man",iconname: Icons.man,),
                 Custom_Column(text: "buety",iconname: Icons.brush),
                 Custom_Column(text: "glasses",iconname: FontAwesomeIcons.glasses,),
               ],
             ),
             SizedBox(height: 20,),
             Container(
               height: h*0.21,
               width: w*0.85,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
               ),
               child: ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.asset("assets/images/girl8.jpg",fit: BoxFit.cover,)),
             ),
             SizedBox(height: 20,),

             Text("Feature Products",style: AppTextStyles.heading1,),
             SizedBox(height: 20,),

             Container(
               height: h*0.45,

               decoration:BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
               ),
               child: ListView.builder(
                   itemCount: productList.length,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index){
                 final item = productList[index];
                 return InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (_)=> DetailPage(item: item)
                         )
                     );
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: h*0.30,
                           width: w*0.45,
                           child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                               child: Image.asset(item["image"]!,fit: BoxFit.cover,
                               )
                           ),
                         ),
                         Text(item['name']!,style: AppTextStyles.heading2,),
                         SizedBox(height: 10,),
                         Text('\$${item['price']}',style: AppTextStyles.heading1,)

                         //  Text(item['price'],style: AppTextStyles.heading1,),

                       ],
                     ),
                   ),
                 );
               }),
                   ),
             Container(
               height: h*0.20,
               width: w*0.90,
               child: Image.asset("assets/images/girl8.jpg",fit: BoxFit.cover,),
             ),

              SizedBox(height: 20,),
             Text("Recommended",style: AppTextStyles.heading1,),
              SizedBox(height: 20,),
             Container(
               height: h*0.12,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                   itemCount: productList.length,
                   itemBuilder: (context,index){
                 final item = productList[index];
                 return InkWell(
                   onTap: (){
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (_)=> DetailPage(item:item)
                         )
                     );
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       width: w*0.70,
                       decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10)
                       ),
                       child: Row(
                         children: [
                           Container(
                             width: w*0.17,
                             height: h*0.12,
                             child: ClipRRect(
                               borderRadius:BorderRadius.circular(10),
                               child: Image.asset(item['image'],fit: BoxFit.cover,),
                             ),
                           ),
                           SizedBox(width: 30,),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(item['name'],style: AppTextStyles.heading2,),
                               Text('\$${item['price']}',style: AppTextStyles.heading1,),
                             ],
                           )
                         ],
                       ),
                     ),
                   ),
                 );
               }),
             )

           ],
               ),
             ),
     ),




    );
  }
}



// custom Column
class Custom_Column extends StatelessWidget {
  final String text;
  final IconData iconname;
  const Custom_Column({super.key,required this.text,required this.iconname});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape:  BoxShape.circle,
          ),
          child: Icon(iconname, size: 20, color: Colors.white),
        ),
        SizedBox(height: 5,),
        Text(text),
      ],
    );
  }
}

