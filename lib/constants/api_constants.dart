// constants/api_constants.dart

class ApiConstants {
  // Base URL of the API
  static const String apiBaseUrl = 'https://api.example.com/'; // Replace with your API base URL

  // Auth API Endpoints
  static const String loginEndpoint = 'auth/login';
  static const String signupEndpoint = 'auth/signup';
  static const String forgotPasswordEndpoint = 'auth/forgot-password';

  // Product API Endpoints
  static const String productsEndpoint = 'products'; // List all products
  static const String productDetailEndpoint = 'products/{id}'; // Get details of a specific product

  // Cart API Endpoints
  static const String cartEndpoint = 'cart'; // Get the user's cart
  static const String addToCartEndpoint = 'cart/add'; // Add product to cart
  static const String removeFromCartEndpoint = 'cart/remove'; // Remove product from cart

  // Order API Endpoints
  static const String createOrderEndpoint = 'orders/create'; // Create a new order
  static const String orderHistoryEndpoint = 'orders/history'; // Get order history
  static const String orderDetailEndpoint = 'orders/{id}'; // Get details of a specific order

  // Headers for API Requests
  static Map<String, String> headers = {
    'Content-Type': 'application/json',  // For sending and receiving JSON data
    'Accept': 'application/json',        // To specify that the response should be in JSON
    // Optionally, add an Authorization token for authenticated requests
    'Authorization': 'Bearer <token>',  // Replace <token> dynamically with the actual token
  };

  // Method to build dynamic endpoints (like product details, order details, etc.)
  static String productDetail(String productId) {
    return 'products/$productId'; // Replace {id} with the actual productId dynamically
  }

  static String orderDetail(String orderId) {
    return 'orders/$orderId'; // Replace {id} with the actual orderId dynamically
  }

  // Example of a POST body template (to send data)
  static Map<String, dynamic> getCreateOrderBody({
    required String userId,
    required double totalAmount,
    required List<String> productIds,
  }) {
    return {
      'user_id': userId,
      'total_amount': totalAmount,
      'product_ids': productIds,
    };
  }
}
