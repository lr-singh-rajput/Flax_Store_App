import 'package:flutter/material.dart';
import 'package:flux_store/Screens/auth/forget_pass_page.dart';
import 'package:flux_store/Screens/auth/register_page.dart';
import 'package:flux_store/Screens/home/home_screen.dart';
import 'package:flux_store/controllers/auth_controller.dart';
import 'package:flux_store/utils/text_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../utils/validators.dart';
// Import the validators you defined above

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key to validate inputs
  final _formKey = GlobalKey<FormState>();

  final authController = Get.put(AuthController());

  // Controllers for email and password input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RxBool isPassHidden = true.obs;


  // Error message variables
  String? _emailError;
  String? _passwordError;

  // Function to validate and submit the form
  void _submit()async {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      authController.setLoginStatus(true);
      bool isLogin = await authController.getLoginStatus();
      print("value of isLogin is => $isLogin");

      // Form is valid, proceed with login logic (e.g., API call)
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    } else {
      // Form is invalid, show error messages
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40,),
                Text(
                  "Login to \n Your Account", style: AppTextStyles.heading1,),
                SizedBox(height: 70,),
                // Email TextField
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: _emailError, // Show error if any
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!Validators.isValidEmail(email)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password TextField
                Obx(() {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: isPassHidden.value,
                    onTap: () {
                      isPassHidden.value = !isPassHidden.value;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(isPassHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      labelText: 'Password',
                      errorText: _passwordError, // Show error if any
                    ),
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter a password';
                      } else if (!Validators.isValidPassword(password)) {
                        return 'Password must be at least 8 characters, contain at least one uppercase, one lowercase, and one number';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            _) => ForgetPassPage()));
                      },
                      child: Text('Forget Password', style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13, fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                // Login Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _submit,
                      child: Text('Login'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            _) => RegisterPage()));
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
