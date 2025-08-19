import 'package:flutter/material.dart';
import 'package:flux_store/cusrom_widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../cusrom_widgets/SidebarMenu.dart';

class MyOrdersScreen extends StatelessWidget {
  List<Map<String, dynamic>> orders = [
    {
      "orderId": "#1524",
      "trackingNumber": "IK237368883",
      "quantity": 2,
      "subtotal": 110.0,
      "status": "Pending",
    },
    {
      "orderId": "#1525",
      "trackingNumber": "IK237368884",
      "quantity": 1,
      "subtotal": 75.0,
      "status": "Delivered",
    },
    {
      "orderId": "#1526",
      "trackingNumber": "IK237368885",
      "quantity": 3,
      "subtotal": 210.0,
      "status": "Delivered",
    },
    {
      "orderId": "#1527",
      "trackingNumber": "IK237368886",
      "quantity": 2,
      "subtotal": 150.0,
      "status": "Cancelled",
    },
    {
      "orderId": "#1528",
      "trackingNumber": "IK237368887",
      "quantity": 4,
      "subtotal": 320.0,
      "status": "Pending",
    },
    {
      "orderId": "#1529",
      "trackingNumber": "IK237368888",
      "quantity": 1,
      "subtotal": 60.0,
      "status": "Delivered",
    },
    {
      "orderId": "#1530",
      "trackingNumber": "IK237368889",
      "quantity": 2,
      "subtotal": 130.0,
      "status": "Cancelled",
    },
    {
      "orderId": "#1531",
      "trackingNumber": "IK237368890",
      "quantity": 5,
      "subtotal": 450.0,
      "status": "Pending",
    },
    {
      "orderId": "#1524",
      "trackingNumber": "IK237368883",
      "quantity": 2,
      "subtotal": 110.0,
      "status": "Pending",
    },
    {
      "orderId": "#1525",
      "trackingNumber": "IK237368884",
      "quantity": 1,
      "subtotal": 75.0,
      "status": "Delivered",
    },
    {
      "orderId": "#1526",
      "trackingNumber": "IK237368885",
      "quantity": 3,
      "subtotal": 210.0,
      "status": "Delivered",
    },
    {
      "orderId": "#1527",
      "trackingNumber": "IK237368886",
      "quantity": 2,
      "subtotal": 150.0,
      "status": "Cancelled",
    },
    {
      "orderId": "#1528",
      "trackingNumber": "IK237368887",
      "quantity": 4,
      "subtotal": 320.0,
      "status": "Pending",
    },
    {
      "orderId": "#1529",
      "trackingNumber": "IK237368888",
      "quantity": 1,
      "subtotal": 60.0,
      "status": "Delivered",
    },
    {
      "orderId": "#1530",
      "trackingNumber": "IK237368889",
      "quantity": 2,
      "subtotal": 130.0,
      "status": "Cancelled",
    },
    {
      "orderId": "#1531",
      "trackingNumber": "IK237368890",
      "quantity": 5,
      "subtotal": 450.0,
      "status": "Pending",
    },
  ];

  RxString selectedStatus = 'Pending'.obs;

//   List<Map<String,dynamic>> filteredOrder() {
//     return orders.where((filterItem){
//      return filterItem['status']==selectedStatus;
//   }).toList();
// }


  List<Map<String, dynamic>> get filteredOrders =>
      orders.where((item) => item['status'] == selectedStatus.value).toList();

  CustomFilterButton(String status) {
    return Obx(() {
      bool isSelected = selectedStatus == status;
      return Expanded(child: InkWell(
        onTap: () {
          selectedStatus.value = status;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
              )
          ),
          child: Center(
            child: Text(status, style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Orders'),
      drawer: Drawer(
        child: SidebarMenu(), // ✅ Your custom sidebar widget
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(children: [
              CustomFilterButton('Pending'),
              CustomFilterButton('Cancelled'),
              CustomFilterButton('Delivered'),
            ],),

            SizedBox(height: 20,),

            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, Index) {
                    final item = filteredOrders[Index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        title: Text("Order ID: ${item['orderId']}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tracking: ${item['trackingNumber']}"),
                            Text("Quantity: ${item['quantity']}"),
                            Text("Subtotal: ₹${item['subtotal']}"),
                            Text("Status: ${item['status']}"),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}





