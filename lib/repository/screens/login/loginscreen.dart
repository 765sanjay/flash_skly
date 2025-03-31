import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';
import '../bottomnav/bottomnavscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showEmailField = false;
  bool showPhoneField = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UiHelper.CustomImage(img: "Blinkit Onboarding Screen.png"),
              SizedBox(height: 30),
              UiHelper.CustomImage(img: "image 10.png"),
              SizedBox(height: 20),
              UiHelper.CustomText(
                text: "India's last minute app",
                color: Color(0XFF000000),
                fontweight: FontWeight.bold,
                fontsize: 20,
                fontfamily: "bold",
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: showEmailField || showPhoneField ? 300 : 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      // Email Input Field (shown when showEmailField is true)
                      if (showEmailField) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Enter your email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],

                      // Phone Input Field (shown when showPhoneField is true)
                      if (showPhoneField) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],

                      // Login with Email Button
                      SizedBox(
                        height: 48,
                        width: 295,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showEmailField = !showEmailField;
                              if (showEmailField) showPhoneField = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF6C445),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UiHelper.CustomText(
                                text: showEmailField
                                    ? "Submit Email"
                                    : "Login with mail",
                                color: Color(0xFF2F4858),
                                fontweight: FontWeight.bold,
                                fontsize: 14,
                                fontfamily: "bold",
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 8),

                      // OR Divider
                      if (!showEmailField && !showPhoneField)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("OR"),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                        ),

                      // Login with Phone Option
                      if (!showPhoneField)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showPhoneField = !showPhoneField;
                              if (showPhoneField) showEmailField = false;
                            });
                          },
                          child: UiHelper.CustomText(
                            text: showPhoneField
                                ? "Submit Phone"
                                : "or login with phone number",
                            color: Color(0XFF269237),
                            fontweight: FontWeight.normal,
                            fontsize: 14,
                          ),
                        ),

                      // Submit Button for Phone (shown when phone field is visible)
                      if (showPhoneField) ...[
                        SizedBox(height: 16),
                        SizedBox(
                          height: 48,
                          width: 295,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle phone submission
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF009085),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Submit Phone",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],

                      // Submit Button for Email (shown when email field is visible)
                      if (showEmailField) ...[
                        SizedBox(height: 16),
                        SizedBox(
                          height: 48,
                          width: 295,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle email submission
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF009085),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Submit Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}