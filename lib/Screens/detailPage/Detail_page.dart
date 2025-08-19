import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flux_store/Screens/card/card_page.dart';
import 'package:flux_store/utils/app_colors.dart';
import 'package:flux_store/utils/text_styles.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> item;
  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
String selectedSize = 'L';
String? selectedColorName;
Color? selectedColor;
class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    // final List<Color> colors = [Colors.brown, Colors.red, Colors.black];
    final Map<String, Color> colorOptions = {
      'Brown': Colors.brown,
      'Red': Colors.red,
      'Black': Colors.black,
      'Grey': Colors.grey,
    };
    final List<String> sizes = ['S', 'M', 'L'];
    final List<int> ratingPercent = [80, 12, 5, 2, 1];

    return Scaffold(
      body: SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                  children: [
                    Container(
                      height: h*0.55,
                      width: double.infinity,
                      child: Image.asset(widget.item['image']!,fit: BoxFit.cover,),
                    ),
                    Positioned(
                      left: 20,top: 20,
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                            ),
                            child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
                          ),
                        )
                    ),
                    Positioned(
                      right: 20,top: 20,
                        child: Container(
                          height: 40,width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.favorite,color: Colors.red,size: 30,),
                        )
                    ),

                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.item['name']!,style: AppTextStyles.heading1,),
                          Text('\$${widget.item['price']}',style: AppTextStyles.heading1,)
                        ],
                      ),

                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: widget.item["rating"]!,
                            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 20.0,
                          ),
                          SizedBox(width: 8),
                          Text(widget.item['totalReviews'].toString()),
                        ],
                      ),
                      SizedBox(height: 16,),
                      //color
                      Row(
                        children: colorOptions.entries
                            .map((color) {
                          final colorName = color.key;
                          final colorValue = color.value;
                              return InkWell(

                          onTap: (){
                            setState(() {
                              selectedColor = colorValue;
                              selectedColorName = colorName;
                            });
                          },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                                        width: 30,height: 30,
                                                        decoration: BoxDecoration(
                              color: colorValue,//jo coler hai wo aaye ga list ke ander se
                              shape: BoxShape.circle,
                              border: Border.all(
                                width:  selectedColor == colorValue ? 2 :1,
                                  color: selectedColor == colorValue ? Colors.black : Colors.grey )
                                                        ),
                                                      ),
                            );
                          }
                        ).toList(),
                      ),
                     SizedBox(height: 20,), //size
                      Row(
                        children: sizes
                        .map((size)=> InkWell(
                          onTap: (){

                            setState(() {
                              selectedSize = size;
                              print(size);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                            decoration: BoxDecoration(
                              color: selectedSize  == size? Colors.black : Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(size,style: TextStyle(
                              color: selectedSize  == size? Colors.white : Colors.black
                            ),),
                          ),
                        )).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                ExpansionTile(
                  title: Text("Description"),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        "Sportwear is no longer under culture, it is no longer indie or cobbled together as it once was. Sport is fashion today. The top is oversized in fit and style, may need to size down.",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),

                ExpansionTile(title: Text('Reviews'),
                children: [
                  Row(
                    children: [
                      Text('${widget.item["rating"]!}',
                      style: AppTextStyles.heading1,
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          RatingBarIndicator(
                            rating : widget.item["rating"],

                              itemBuilder : (context,index)=>
                                  Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 20.0,
                          ),
                          SizedBox(height: 4,),
                          Text(widget.item['totalReviews'].toString()),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 12,),
                  Column(
                    children: List.generate(5, (index){
                      return Row(
                        children: [
                          SizedBox(width: 30,
                          child: Text("${5 - index}"),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                              child: LinearProgressIndicator(
                                value: ratingPercent[index]/100,
                                backgroundColor: Colors.grey.shade300,
                                color: Colors.amber,
                              )
                          ),
                          SizedBox(height: 8,),
                          Text('${ratingPercent[index]}%'),
                        ],
                      );
                    }),
                  )
                ],
                ),
                SizedBox(height: 30,),

                InkWell(
                  onTap: (){

                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CardPage(
                          items:widget.item,
                          color: selectedColorName ?? 'NO COLOR',
                          size: selectedSize,

                      ) ));
                  },
                    child: Container(
                      height: 80,
                        width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryTextColor,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))
                      ),
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag,size: 30,color: Colors.white,),
                          SizedBox(width: 20,),
                          Text('Add To Card',style: AppTextStyles.heading4,),
                        ],
                      )),
                    ),
                  ),
                )
              ],
            ),
          )
      );
  }
}
