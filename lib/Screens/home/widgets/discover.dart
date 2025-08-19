import 'package:flutter/material.dart';
import 'package:flux_store/Screens/home/widgets/search_page.dart';
import 'package:flux_store/cusrom_widgets/app_bar.dart';

import '../../../cusrom_widgets/SidebarMenu.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(title: 'Discover'),
      drawer: Drawer(
        child: SidebarMenu(), // ✅ Your custom sidebar widget
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: "Search",
                        prefixIcon: InkWell(
                            onTap: (){
                              final query = searchController.text.trim();
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchPage(searchQuery: query)));

                            },
                            child: Icon(Icons.search)),
                        suffixIcon: Icon(Icons.filter_list),


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),

                        )
                      ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: h*0.22,
                    width: w*0.90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/girl8.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 14,),
                  Container(
                    height: h*0.22,
                    width: w*0.90,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/girl7.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 14,),
                  Container(
                    height: h*0.22,
                    width: w*0.90,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/girl6.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 14,),
                  Container(
                    height: h*0.22,
                    width: w*0.90,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/girl5.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 14,),
                ],
              ),
            )
        ),
      ),
    );
  }
}
