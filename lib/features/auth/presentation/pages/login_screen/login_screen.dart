import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:hotel_booking_app/config/route.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_event.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_state.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_event.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_state.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:another_flushbar/flushbar.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final emailFieldErrorMessage = useState<String?>(null);
    final passwordFieldErrorMessage = useState<String?>(null);

    useEffect(() {
      void listener() {
        if (emailFieldErrorMessage.value != null) {
          emailFieldErrorMessage.value = null;
        }
      }

      emailController.addListener(listener);
      return () {
        emailController.removeListener(listener);
      };
    }, [emailController]);

    useEffect(() {
      void listener() {
        if (passwordFieldErrorMessage.value != null) {
          passwordFieldErrorMessage.value = null;
        }
        passwordController.addListener(listener);
      }

      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);
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
                SizedBox(height: 40.h),
                _loginSection(
                  emailController,
                  passwordController,
                  context,
                  emailFieldErrorMessage,
                  passwordFieldErrorMessage,
                ),
                SizedBox(height: 20.h),
                _oauthScection(context),
                SizedBox(height: 30.h),
                _sigupBottomAtermSection(context),
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

  Widget _loginSection(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
    ValueNotifier<String?> emailFielderrorMessage,
    ValueNotifier<String?> passwordFieldErrorMessage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _texfieldBuilder(
          "Email",
          Icons.email_outlined,
          false,
          emailController,
        ),
        if (emailFielderrorMessage.value != null)
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 4.h),
            child: Text(
              '${emailFielderrorMessage.value}',
              style: TextStyle(color: Colors.red, fontSize: 9.sp),
            ),
          ),
        SizedBox(height: 18.h),
        _texfieldBuilder(
          "Password",
          Icons.lock_outline,
          true,
          passwordController,
        ),
        if (passwordFieldErrorMessage.value != null)
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 4.h),
            child: Text(
              '${passwordFieldErrorMessage.value}',
              style: TextStyle(color: Colors.red, fontSize: 9.sp),
            ),
          ),
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

        SizedBox(height: 8.h),
        _loginButton(
          emailController,
          passwordController,
          context,
          emailFielderrorMessage,
          passwordFieldErrorMessage,
        ),
      ],
    );
  }

  Widget _texfieldBuilder(
    String hintText,
    IconData icon,
    bool isObscure,
    TextEditingController controller,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.w),
      height: 48.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.grey.shade700),
        ),
      ),
    );
  }

  Widget _oauthScection(BuildContext context) {
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
          _googleAuthButton(),
          SizedBox(height: 13.h),
          _oAuthBuilder(
            "Continue with Facebook",
            "assets/images/facebook_icon.png",
          ),
        ],
      ),
    );
  }

  Widget _googleAuthButton(){
    return BlocConsumer<GoogleLoginBloc, GoogleLoginState>(
      listener: (context, state){
        if(state is GoogleLoginSuccess){
          Flushbar(
            message: 'Login Successful',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,

            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);

          Navigator.pushReplacementNamed(
            context,
            AppRoutes.homePage,
            // arguments: state.user,
          );
        }
        if(state is GoogleLoginError){
          Flushbar(
            message: state.error.toString(),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,

            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      builder: (context, state){
        return GestureDetector(
                onTap: state is GoogleLoginLoading? null :() => _onGoogleLoginButtonPressed(context),
                child: _oAuthBuilder(
                  'Continue with Google',
                  'assets/images/google_icon.webp',
                ),
              );
      }
    );
  }

  Widget _oAuthBuilder(String text, String image) {
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
            Image.asset(image, height: 28.h, width: 20.w),
            SizedBox(width: 8.w),
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

  Widget _loginButton(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
    ValueNotifier<String?> emailFielderrorMessage,
    ValueNotifier<String?> passwordFielderrorMessage,
  ) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Flushbar(
            message: 'Login Successful',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,

            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);

          Navigator.pushReplacementNamed(
            context,
            AppRoutes.homePage,
            arguments: state.user,
          );
        }
        if (state is LoginError) {
          Flushbar(
            message: state.error.toString(),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,

            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap:
              state is LoginLoading
                  ? null
                  : () {
                    _onLoginButtonPressed(
                      context,
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      passwordFielderrorMessage,
                      emailFielderrorMessage
                    );
                  },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            height: 45.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColours.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child:
                  state is LoginLoading
                      ? SizedBox(
                        width: 17.w,
                        height: 20.h,
                        child: CircularProgressIndicator(color: Colors.black),
                      )
                      : SubTitleText(
                        text: "Log In",
                        color: const Color.fromARGB(255, 39, 12, 12),
                      ),
            ),
          ),
        );
      },
    );
  }

  Widget _sigupBottomAtermSection(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SmallText(text: "Don't have an account?", color: AppColours.white,),
          SizedBox(width: 4.w,),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.registerPage),
            child: SmallText(text: "Sign up",  color: AppColours.white,),
          ),
        ],
      ),
    );
  }

  void _onLoginButtonPressed(
    BuildContext context,
    String email,
    String password,
    ValueNotifier<String?> passwordFielderrorMessage,
    ValueNotifier<String?> emailFielderrorMessage,
  ) {
    passwordFielderrorMessage.value = null;
    emailFielderrorMessage.value = null;
    if (email.isEmpty) {
      emailFielderrorMessage.value = 'Email cannot be empty';
    } else {
      emailFielderrorMessage.value = null;
    }
    if (password.isEmpty) {
      passwordFielderrorMessage.value = 'Password cannot be empty';
    } else {
      passwordFielderrorMessage.value = null;
    }

    if (!email.isEmail && email.isNotEmpty) {
      emailFielderrorMessage.value = 'Please enter a valid email address';
    }
    if (email.isNotEmpty && password.isNotEmpty && GetUtils.isEmail(email)) {
      BlocProvider.of<LoginBloc>(context).add(Login(email, password));
    }
  }

  void _onGoogleLoginButtonPressed(BuildContext context) {
    BlocProvider.of<GoogleLoginBloc>(context).add(GoogleLogIn());
  }
}
