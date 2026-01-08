import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: FilterHeaderDelegate(
              height: 115.h,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 28.h),
                      child: Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(230, 20, 2, 2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: SmallText(
                        text: 'Start your hotel journey with us.',
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              _textFieldSection(),
              SizedBox(height: 20.h,),
              _oauthSection(),
              _sigupBottomAtermSection(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _textFieldSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textFieldBuilder(
            hintText: "John ",
            labelText: "First Name",
            icon: Icons.person_outline,
          ),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "Doe",
            labelText: "Last Name",
            icon: Icons.person_2_outlined,
          ),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "johndoe@example.com",
            labelText: "Email",
            icon: Icons.message_outlined,
          ),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "08088173983",
            labelText: "Phone Number",
            icon: Icons.phone_outlined,
            keyboardtype: TextInputType.phone,
          ),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "********",
            labelText: "Password",
            icon: Icons.lock_outline,
            isObscure: true,
          ),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "********",
            labelText: "Confirm Password",
            icon: Icons.lock_outline,
            isObscure: true,
          ),
        ],
      ),
    );
  }

  Widget _textFieldBuilder({
    required String hintText,
    required String labelText,
    required IconData icon,
    bool isObscure = false,
    TextInputType keyboardtype = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleText(
          text: labelText,
          fontsize: 11.sp,
          color: Colors.grey.shade800,
        ),
        SizedBox(height: 4.h),
        Container(
          height: 38.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            keyboardType: keyboardtype,
            obscureText: isObscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(icon, color: Colors.grey.shade600),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        ),
      ],
    );
  }

  Widget _oauthSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: Colors.grey.shade100,
                  ),
                ),
                SmallText(text: "  Or sign with  ", ),
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: Colors.grey.shade100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35.h),
          _oAuthBuilder(
            'Continue with Google',
            'assets/images/google_icon.webp',
          ),
          SizedBox(height: 20),
          _oAuthBuilder(
            "Continue with Facebook",
            "assets/images/facebook_icon.png",
          ),
        ],
      ),
    );
  }

  Widget _oAuthBuilder(String text, String image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      height: 45.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColours.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: 28.h, width: 25.w),
            SizedBox(width: 7.w),
            SubTitleText(
              text: text,
              fontsize: 11.sp,
              color: const Color.fromARGB(200, 39, 12, 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sigupBottomAtermSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 18.h),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
                fillColor: WidgetStateProperty.all(AppColours.white),
              ),

                 Expanded(
                   child: Wrap(
                   
                    children: [
                      SmallText(
                        text: "I agree to the ",
                        color: Colors.grey.shade700,
                      ),
                      SmallText(
                        text: "Terms and Condition ",
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      SmallText(
                        text: "and ",
                        color: Colors.grey.shade700,
                      ),
                      SmallText(
                        text: "Privacy",
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      SmallText(
                        text: " Policy.",
                        color: Colors.lightBlueAccent.shade400,
                      ),
                    ],
                                   ),
                 ),
              
            ],
          ),
          SizedBox(height: 9.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 13.w),
            height: 38.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: SubTitleText(
                text: "Sign Up",
                color: AppColours.white,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallText(text: "Already have an account?"),
                SizedBox(width: 4.w,),
                SmallText(text: "Log in", color: Colors.lightBlueAccent.shade400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
