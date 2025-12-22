import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: FilterHeaderDelegate(
              height: 120,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(230, 20, 2, 2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: SmallText(
                        text: 'Start your hotel journey with us.',
                        fontsize: 18,
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textFieldBuilder(
            hintText: "John ",
            labelText: "First Name",
            icon: Icons.person_outline,
          ),
          SizedBox(height: 15),
          _textFieldBuilder(
            hintText: "Doe",
            labelText: "Last Name",
            icon: Icons.person_2_outlined,
          ),
          SizedBox(height: 15),
          _textFieldBuilder(
            hintText: "johndoe@example.com",
            labelText: "Email",
            icon: Icons.message_outlined,
          ),
          SizedBox(height: 15),
          _textFieldBuilder(
            hintText: "08088173983",
            labelText: "Phone Number",
            icon: Icons.phone_outlined,
            keyboardtype: TextInputType.phone,
          ),
          SizedBox(height: 15),
          _textFieldBuilder(
            hintText: "********",
            labelText: "Password",
            icon: Icons.lock_outline,
            isObscure: true,
          ),
          SizedBox(height: 15),
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
          fontsize: 16,
          color: Colors.grey.shade800,
        ),
        SizedBox(height: 5),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
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
                  color: Colors.grey.shade300,
                ),
              ),
              SmallText(text: "  Or continue with  ", fontsize: 16),
              Expanded(
                child: Container(
                  height: 1,
                  width: 100,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
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
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColours.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: 30, width: 30),
            SizedBox(width: 10),
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

  Widget _sigupBottomAtermSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                        fontsize: 14,
                        color: Colors.grey.shade700,
                      ),
                      SmallText(
                        text: "Terms and Condition ",
                        fontsize: 14,
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      SmallText(
                        text: "and ",
                        fontsize: 14,
                        color: Colors.grey.shade700,
                      ),
                      SmallText(
                        text: "Privacy",
                        fontsize: 14,
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      SmallText(
                        text: " Policy.",
                        fontsize: 14,
                        color: Colors.lightBlueAccent.shade400,
                      ),
                    ],
                                   ),
                 ),
              
            ],
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SubTitleText(
                text: "Sign Up",
                fontsize: 20,
                color: AppColours.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallText(text: "Already have an account?"),
                SizedBox(width: 5,),
                SmallText(text: "Log in", color: Colors.lightBlueAccent.shade400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
