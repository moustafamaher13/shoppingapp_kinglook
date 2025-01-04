import 'package:flutter/material.dart';
import 'product_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   TextEditingController _fullNameController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   TextEditingController _confirmPasswordController = TextEditingController();
   final _formKey = GlobalKey<FormState>();

  bool _validateFullName(String value) {
    return value.isNotEmpty && value[0].toUpperCase() == value[0];
  }

  bool _validateEmail(String value) {
    return value.contains('@');
  }

  bool _validatePassword(String value) {
    return value.length >= 6;
  }

  bool _validateConfirmPassword(String value) {
    return value == _passwordController.text;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Account Created Successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (!_validateFullName(value!)) {
                    return 'Full Name should start with a capital letter';
                  }
                  return null;
                },
              ),
              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (!_validateEmail(value!)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (!_validatePassword(value!)) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                validator: (value) {
                  if (!_validateConfirmPassword(value!)) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _showSuccessDialog();
                  } else {
                    _showErrorSnackbar('Please fill in all fields correctly');
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
