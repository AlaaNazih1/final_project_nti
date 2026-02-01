import 'package:flutter/material.dart';
import 'package:provider_task/screens/login_screen.dart';
import 'package:provider_task/screens/register_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

            
          
             
            Image.asset('assets/images/logo.png', height: 120),
              const SizedBox(height: 30),

              
             
              Image.asset('assets/images/Title.png', height: 60),
              const SizedBox(height: 12),

              
              const Text(
                'Beautiful eCommerce UI Kit\nfor your online store',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
              ),

              const Spacer(),

              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xff004CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Let's get started",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I already have an account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                    },
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor:Color(0xff004CFF),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
