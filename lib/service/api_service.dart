// api_service.dart
//
// import 'dart:convert';
//
//
// class ApiService {
//   // Method to fetch products
//   Future<List<Product>> fetchProducts() async {
//     final response = await http.get(Uri.parse('${Constants.apiBaseUrl}products'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => Product.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }
//
//   // Method to fetch product by id
//   Future<Product> fetchProductById(String id) async {
//     final response = await http.get(Uri.parse('${Constants.apiBaseUrl}products/$id'));
//
//     if (response.statusCode == 200) {
//       return Product.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load product');
//     }
//   }
// }