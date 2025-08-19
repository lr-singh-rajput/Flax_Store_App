
import 'package:flutter/material.dart';

import '../auth/login_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  int _currentPage = 1;

  final List<Map<String, String>> pages = [
    {
      'title': 'Discover something new',
      'subtitle': 'Special new arrivals just for you',
      'image': 'assets/images/girl1.jpg',
    },
    {
      'title': 'Update trendy outfit',
      'subtitle': 'Favorite brands and hottest trends',
      'image': 'assets/images/girl2.jpg',
    },
    {
      'title': 'Explore your true style',
      'subtitle': 'Relax and let us bring the style to you',
      'image': 'assets/images/girl3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
             //   controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          pages[index]['title']!,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          pages[index]['subtitle']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            pages[index]['image']!,
                            width: w * 0.85,
                            height: h * 0.45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 10 : 6,
                  height: _currentPage == index ? 10 : 6,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.black
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Shopping now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flux_store/Screens/auth/login_page.dart';
// import 'package:flux_store/utils/app_colors.dart';
// import 'package:flux_store/utils/text_styles.dart';
//
// import '../../cusrom_widgets/custem_button.dart';
//
// class IntroPage extends StatelessWidget {
//   const IntroPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height:  double.infinity,
//           width: double.infinity,
//           child: Column(
//             children: [
//               SizedBox(height: 20,),
//               Text("Discover Something New",style: AppTextStyles.heading1,),
//               SizedBox(height: 10,),
//               Text("Special new arrivals just for you",style: AppTextStyles.heading2,),
//               SizedBox(height: 10,),
//               Container(
//                 child: Align(
//                     child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset("assets/images/girl6.jpg",
//                     width:w*0.90,
//                     height: h*0.45,
//                     fit: BoxFit.cover,),
//                 )),
//               ),
//
//               SizedBox(height: 50,),
//               InkWell(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
//                   },
//                   child: CustemButton(text: 'Shoping Now',)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
