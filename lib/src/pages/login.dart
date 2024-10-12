import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(),
              // Netflix logo or a similar logo
              Center(
                child: Image.asset(
                  'assets/images/netflix_icon.png', // Add your logo asset path
                  height: 60.0,
                ),
              ),
              const SizedBox(height: 40),

              // Login Title
              Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Email Input Field
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 20.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Input Field
              TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 20.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sign In Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size(double.infinity, 50), // Full width
                    backgroundColor: Colors.red, // Netflix red color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    // Login logic here
                    Navigator.pop(
                        context); // Return to the previous screen after login
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              // Spacer for bottom alignment
              const Spacer(),

              // Sign up option
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to the sign-up page
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "New to Netflix? ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign up now.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
