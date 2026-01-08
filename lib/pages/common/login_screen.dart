import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            left: 9.w,
            right: 9.h,
            top: 95.h,
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
          height: 75.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: AppColours.white,
          ),
          child: Icon(
            Icons.apartment_outlined,
            color: Colors.grey.shade100,
            size: 60.sp,
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          "Welcome Back!",
          style: TextStyle(
            color: AppColours.white,
            fontSize: 26.sp,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 8.h),
        SmallText(
          text: "Sign in to continue your hotel booking",
          color: AppColours.white,
          fontsize: 10.sp,
        ),
        SmallText(text: "adventure.", color: AppColours.white, fontsize: 10.sp),
      ],
    );
  }

  Widget _loginSection() {
    return Column(
      children: [
        _texfieldBuilder("Email or Phone Number", Icons.email_outlined, false),
        SizedBox(height: 18.h),
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
              fontsize: 9.sp,
            ),
            SizedBox(width: 55.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 18.h),
                SmallText(
                  text: "Forget password?",
                  color: AppColours.white,
                  fontsize: 9.sp,
                ),
              ],
            ),
          ],
        ),

        // login button
        SizedBox(height: 8.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          height: 45.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColours.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: SubTitleText(
              text: "Log In",
              color: const Color.fromARGB(255, 39, 12, 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _texfieldBuilder(String hintText, IconData icon, bool isObscure) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.w),
      height: 48.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(10.r),
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
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 1.h,
                  width: 100.w,
                  color: AppColours.white,
                ),
              ),
              SmallText(
                text: "  Or continue with  ",
                color: AppColours.white,
                fontsize: 9.sp,
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
          SizedBox(height: 28.h),
          _oAuthBuilder( 'Continue with Google', 'assets/images/google_icon.webp'),
          SizedBox(height: 13.h),
          _oAuthBuilder("Continue with Facebook", "assets/images/facebook_icon.png"),
        ],
      ),
    );
  }

  Widget _oAuthBuilder( String text, String image) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      height: 45.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: 28.h, width: 20.w,),
            SizedBox(width: 8.w,),
            SmallText(
              text: text,
              fontsize: 9.sp,
              color: const Color.fromARGB(200, 39, 12, 12),
            ),
          ],
        ),
      ),
    );
  }
}
