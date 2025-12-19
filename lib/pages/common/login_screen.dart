import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.repeated,
                stops: [0.0, 0.9],
                colors: [
                  Color.fromARGB(200, 14, 168, 234), // blue
                  // Color(0xFF8BC6A3), // green
                  Color(0xFFF2C078), // yellow
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: 100,
            child: Column(
              children: [
                _welcomeBackSection(),
                SizedBox(height: 50),
                _loginSection(),
                SizedBox(height: 20),
                _oauthScection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _welcomeBackSection() {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColours.white,
          ),
          child: Icon(
            Icons.apartment_outlined,
            color: Colors.grey.shade100,
            size: 80,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Welcome Back!",
          style: TextStyle(
            color: AppColours.white,
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 10),
        SmallText(
          text: "Sign in to continue your hotel booking",
          color: AppColours.white,
          fontsize: 18,
        ),
        SmallText(text: "adventure.", color: AppColours.white, fontsize: 18),
      ],
    );
  }

  Widget _loginSection() {
    return Column(
      children: [
        _texfieldBuilder("Email or Phone Number", Icons.email_outlined, false),
        SizedBox(height: 20),
        _texfieldBuilder("Password", Icons.lock_outline, true),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: ((value) {
                value = true;
              }),
              fillColor: WidgetStateProperty.all(AppColours.white),
              checkColor: Colors.blue.shade400,
            ),
            SmallText(
              text: "Remember me",
              color: AppColours.white,
              fontsize: 17,
            ),
            SizedBox(width: 75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                SmallText(
                  text: "Forget password?",
                  color: AppColours.white,
                  fontsize: 17,
                ),
              ],
            ),
          ],
        ),

        // login button
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColours.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SubTitleText(
              text: "Log In",
              fontsize: 20,
              color: const Color.fromARGB(255, 39, 12, 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _texfieldBuilder(String hintText, IconData icon, bool isObscure) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.grey.shade700),
        ),
      ),
    );
  }

  Widget _oauthScection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  width: 100,
                  color: AppColours.white,
                ),
              ),
              SmallText(
                text: "  Or continue with  ",
                color: AppColours.white,
                fontsize: 16,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  width: 100,
                  color: AppColours.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          _oAuthBuilder( 'Continue with Google', 'assets/images/google_icon.webp'),
          SizedBox(height: 20),
          _oAuthBuilder("Continue with Facebook", "assets/images/facebook_icon.png"),
        ],
      ),
    );
  }

  Widget _oAuthBuilder( String text, String image) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: 30, width: 30,),
            SizedBox(width: 10,),
            SubTitleText(
              text: text,
              fontsize: 15,
              color: const Color.fromARGB(200, 39, 12, 12),
            ),
          ],
        ),
      ),
    );
  }
}
