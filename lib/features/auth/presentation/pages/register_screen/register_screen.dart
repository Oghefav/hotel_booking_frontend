import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:hotel_booking_app/config/route.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_event.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/register/register_state.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final emailFieldErrorMessage = useState<String?>(null);
    final passwordFieldErrorMessage = useState<String?>(null);
    final firstNameFieldErrorMessage = useState<String?>(null);
    final lastNameFieldErrorMessage = useState<String?>(null);
    final phoneNumberFieldErrorMessage = useState<String?>(null);
    final confirmPasswordFieldErrorMessage = useState<String?>(null);
    final passWordFocusNode = useFocusNode();
    final confirmPasswordFocusNode = useFocusNode();
    final showPasswordValidation = useState<bool>(false);
    final passwordMatch = useState<bool>(false);
    final passwordLengthValid = useState<bool>(false);
    final passwordUpperCaseValid = useState<bool>(false);
    final passwordLowerCaseValid = useState<bool>(false);
    final passwordSpecialCharValid = useState<bool>(false);
    final passwordNumberValid = useState<bool>(false);
    final isFormValid = useState<bool>(false);
    final termsAgreed = useState<bool>(false);
    final passwordObscured = useState<bool>(true);
    final confirmPasswordObscured = useState<bool>(true);

    useEffect(() {
      void listener() {
        if (termsAgreed.value) {
          termsAgreed.value = true;
        } else {
          termsAgreed.value = false;
        }
      }
    }, [termsAgreed]);
    // useEffect(() {
    //   void listener() {
    //     passwordObscured.value = !passwordObscured.value;
    //   }

    //   return () {};
    // });

    // useEffect(() {
    //   void listener() {
    //     confirmPasswordObscured.value = !confirmPasswordObscured.value;
    //   }

    //   return () {};
    // }, [confirmPasswordObscured]);
    useEffect(() {
      listener() {
        passwordMatch.value =
            confirmPasswordController.text == passwordController.text &&
                    confirmPasswordController.text.isNotEmpty
                ? true
                : false;
      }

      passwordController.addListener(listener);
      confirmPasswordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
        confirmPasswordController.removeListener(listener);
      };
    }, [passwordController, confirmPasswordController]);

    useEffect(() {
      void listener() {
        passwordNumberValid.value = passwordController.text.contains(
          RegExp(r'[0-9]'),
        );
      }

      passwordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);

    useEffect(() {
      void listener() {
        passwordLengthValid.value = passwordController.text.length >= 8;
      }

      passwordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);

    useEffect(() {
      void listener() {
        passwordUpperCaseValid.value = passwordController.text.contains(
          RegExp(r'[A-Z]'),
        );
      }

      passwordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);

    useEffect(() {
      void listener() {
        passwordLowerCaseValid.value = passwordController.text.contains(
          RegExp(r'[a-z]'),
        );
      }

      passwordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);

    useEffect(() {
      void listener() {
        passwordSpecialCharValid.value = passwordController.text.contains(
          RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
        );
      }

      passwordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);
    useEffect(() {
      void focusListener() {
        showPasswordValidation.value =
            passWordFocusNode.hasFocus || confirmPasswordFocusNode.hasFocus;
      }

      passWordFocusNode.addListener(focusListener);
      confirmPasswordFocusNode.addListener(focusListener);
      return () {
        passWordFocusNode.removeListener(focusListener);
        confirmPasswordFocusNode.removeListener(focusListener);
      };
    }, [passWordFocusNode, confirmPasswordFocusNode]);

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
    isFormValid.value =
        passwordLengthValid.value &&
        passwordUpperCaseValid.value &&
        passwordLowerCaseValid.value &&
        passwordSpecialCharValid.value &&
        passwordNumberValid.value &&
        passwordMatch.value &&
        emailController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        termsAgreed.value;
  }

  // List of all things to listen to
  final notifiers = [
    passwordLengthValid, 
    passwordUpperCaseValid, 
    passwordLowerCaseValid, 
    passwordSpecialCharValid, 
    passwordNumberValid,
    passwordMatch,
    termsAgreed
  ];
  
  final controllers = [
    emailController,
    firstNameController,
    lastNameController,
    phoneNumberController
  ];

  // Attach all
  for (var n in notifiers){ n.addListener(listener);}
  for (var c in controllers) {c.addListener(listener);}

  return () {
    // Detach all
    for (var n in notifiers){ n.removeListener(listener);}
    for (var c in controllers) {
      c.removeListener(listener);
    }
  };
}, [
  // Keep the dependency array updated with the objects being watched
  passwordLengthValid, passwordUpperCaseValid, passwordLowerCaseValid,
  passwordSpecialCharValid, passwordNumberValid, passwordMatch, termsAgreed,
  emailController, firstNameController, lastNameController, phoneNumberController
]);

    useEffect(() {
      void listener() {
        if (passwordFieldErrorMessage.value != null) {
          passwordFieldErrorMessage.value = null;
        }
      }

      passwordController.addListener(listener);
      return () {
        passwordController.removeListener(listener);
      };
    }, [passwordController]);

    useEffect(() {
      void listener() {
        if (firstNameFieldErrorMessage.value != null) {
          firstNameFieldErrorMessage.value = null;
        }
      }

      firstNameController.addListener(listener);
      return () {
        firstNameController.removeListener(listener);
      };
    }, [firstNameController]);

    useEffect(() {
      void listener() {
        if (lastNameFieldErrorMessage.value != null) {
          lastNameFieldErrorMessage.value = null;
        }
      }

      lastNameController.addListener(listener);
      return () {
        lastNameController.removeListener(listener);
      };
    }, [lastNameController]);

    useEffect(() {
      void listener() {
        if (phoneNumberFieldErrorMessage.value != null) {
          phoneNumberFieldErrorMessage.value = null;
        }
      }

      phoneNumberController.addListener(listener);
      return () {
        phoneNumberController.removeListener(listener);
      };
    }, [phoneNumberController]);

    useEffect(() {
      void listener() {
        if (confirmPasswordFieldErrorMessage.value != null) {
          confirmPasswordFieldErrorMessage.value = null;
        }
      }

      confirmPasswordController.addListener(listener);
      return () {
        confirmPasswordController.removeListener(listener);
      };
    }, [confirmPasswordController]);

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
              _textFieldSection(
                firstNameController,
                lastNameController,
                emailController,
                phoneNumberController,
                passwordController,
                confirmPasswordController,
                emailFieldErrorMessage,
                passwordFieldErrorMessage,
                firstNameFieldErrorMessage,
                lastNameFieldErrorMessage,
                phoneNumberFieldErrorMessage,
                confirmPasswordFieldErrorMessage,
                showPasswordValidation,
                passwordMatch,
                passwordLengthValid,
                passwordUpperCaseValid,
                passwordLowerCaseValid,
                passwordSpecialCharValid,
                passwordNumberValid,
                passwordObscured,
                confirmPasswordObscured,
              ),
              SizedBox(height: 10.h),
              _sigupBottomAtermSection(
                context,
                showPasswordValidation,
                emailFieldErrorMessage,
                passwordFieldErrorMessage,
                firstNameFieldErrorMessage,
                lastNameFieldErrorMessage,
                phoneNumberFieldErrorMessage,
                confirmPasswordFieldErrorMessage,
                firstNameController,
                lastNameController,
                emailController,
                phoneNumberController,
                passwordController,
                confirmPasswordController,
                isFormValid,
                termsAgreed,
              ),
              _oauthSection(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _textFieldSection(
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController email,
    TextEditingController phoneNumber,
    TextEditingController password,
    TextEditingController confirmPassword,
    ValueNotifier<String?> emailFieldErrorMessage,
    ValueNotifier<String?> passwordFieldErrorMessage,
    ValueNotifier<String?> firstNameFieldErrorMessage,
    ValueNotifier<String?> lastNameFieldErrorMessage,
    ValueNotifier<String?> phoneNumberFieldErrorMessage,
    ValueNotifier<String?> confirmPasswordFieldErrorMessage,
    ValueNotifier<bool> showPasswordValidation,
    ValueNotifier<bool> passwordMatch,
    ValueNotifier<bool> passwordLengthValid,
    ValueNotifier<bool> passwordUpperCaseValid,
    ValueNotifier<bool> passwordLowerCaseValid,
    ValueNotifier<bool> passwordSpecialCharValid,
    ValueNotifier<bool> passwordNumberValid,
    ValueNotifier<bool> passwordObscured,
    ValueNotifier<bool> confirmPasswordObscured,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textFieldBuilder(
            hintText: "John ",
            labelText: "First Name",
            icon: Icons.person_outline,
            controller: firstNameController,
          ),
          _errorTextBuilder(firstNameFieldErrorMessage),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "Doe",
            labelText: "Last Name",
            icon: Icons.person_2_outlined,
            controller: lastNameController,
          ),
          _errorTextBuilder(lastNameFieldErrorMessage),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "johndoe@example.com",
            labelText: "Email",
            icon: Icons.message_outlined,
            controller: email,
          ),
          _errorTextBuilder(emailFieldErrorMessage),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "08088173983",
            labelText: "Phone Number",
            icon: Icons.phone_outlined,
            keyboardtype: TextInputType.phone,
            controller: phoneNumber,
          ),
          _errorTextBuilder(phoneNumberFieldErrorMessage),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "********",
            labelText: "Password",
            icon: Icons.lock_outline,
            isObscure: passwordObscured,
            onTap: () => showPasswordValidation.value = true,
            controller: password,
          ),
          if (showPasswordValidation.value)
            _validatorBuilder(
              text: 'Password must have 8 characters',
              isValid: passwordLengthValid.value,
            ),
          if (showPasswordValidation.value)
            _validatorBuilder(
              text: 'Password must have an uppercase letter',
              isValid: passwordUpperCaseValid.value,
            ),
          if (showPasswordValidation.value)
            _validatorBuilder(
              text: 'Password must have a lowercase letter',
              isValid: passwordLowerCaseValid.value,
            ),
          if (showPasswordValidation.value)
            _validatorBuilder(
              text: 'Password must have a special character',
              isValid: passwordSpecialCharValid.value,
            ),
          if (showPasswordValidation.value)
            _validatorBuilder(
              text: 'Password must have a number',
              isValid: passwordNumberValid.value,
            ),
          _errorTextBuilder(passwordFieldErrorMessage),
          SizedBox(height: 14.h),
          _textFieldBuilder(
            hintText: "********",
            labelText: "Confirm Password",
            icon: Icons.lock_outline,
            isObscure: confirmPasswordObscured,
            onTap: () => showPasswordValidation.value = true,
            controller: confirmPassword,
          ),
          if (showPasswordValidation.value)
            _validatorBuilder(
              text: "Passwords match",
              isValid: passwordMatch.value ? true : false,
            ),
          _errorTextBuilder(confirmPasswordFieldErrorMessage),
        ],
      ),
    );
  }

  Widget _validatorBuilder({required String text, required bool isValid}) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel_outlined,
          color: isValid ? Colors.green : Colors.redAccent,
          size: 14.sp,
        ),
        SizedBox(width: 4.w),
        SmallText(text: text, color: isValid ? Colors.green : Colors.redAccent),
      ],
    );
  }

  Widget _textFieldBuilder({
    required String hintText,
    required String labelText,
    required IconData icon,
    ValueNotifier<bool>? isObscure,
    VoidCallback? onTap,
    TextInputType keyboardtype = TextInputType.text,
    required TextEditingController controller,
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
            onTap: onTap,
            controller: controller,
            obscureText: isObscure != null ? isObscure.value : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(icon, color: Colors.grey.shade600),
              suffixIcon:
                  isObscure != null
                      ? GestureDetector(
                        onTap: () => isObscure.value = !isObscure.value,
                        child: Icon(
                          isObscure.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey.shade600,
                        ),
                      )
                      : null,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        ),
      ],
    );
  }

  Widget _errorTextBuilder(ValueNotifier error) {
    if (error.value == null) {
      return SizedBox.shrink();
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.redAccent, size: 14.sp),
            SizedBox(width: 4.w),
            SmallText(text: error.value.toString(), color: Colors.redAccent),
          ],
        ),
      );
    }
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
                  child: Container(height: 1.h, color: Colors.grey.shade100),
                ),
                SmallText(text: "  Or sign up with  "),
                Expanded(
                  child: Container(height: 1.h, color: Colors.grey.shade100),
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

  Widget _sigupBottomAtermSection(
    BuildContext context,
    ValueNotifier<bool> showPasswordValidation,
    ValueNotifier<String?> emailFieldErrorMessage,
    ValueNotifier<String?> passwordFieldErrorMessage,
    ValueNotifier<String?> firstNameFieldErrorMessage,
    ValueNotifier<String?> lastNameFieldErrorMessage,
    ValueNotifier<String?> phoneNumberFieldErrorMessage,
    ValueNotifier<String?> confirmPasswordFieldErrorMessage,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController email,
    TextEditingController phoneNumber,
    TextEditingController password,
    TextEditingController confirmPassword,
    ValueNotifier isFormValid,
    ValueNotifier<bool> termsAgreed,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 18.h),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: termsAgreed.value,
                onChanged: (value) {
                  termsAgreed.value = value ?? false;
                },
                checkColor: Colors.blueAccent,
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
                    SmallText(text: "and ", color: Colors.grey.shade700),
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
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                Navigator.pushNamed(context, AppRoutes.loginPage);
              }
              if (state is RegisterError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.serverMessage)));
              }
            },
            builder: (context, state) {
              return GestureDetector(
                onTap:
                    state is RegisterLoading
                        ?  null  : () => _onSignup(
                          context,
                          firstNameController.text,
                          lastNameController.text,
                          email.text,
                          phoneNumber.text,
                          password.text,
                          confirmPassword.text,
                          emailFieldErrorMessage,
                          passwordFieldErrorMessage,
                          firstNameFieldErrorMessage,
                          lastNameFieldErrorMessage,
                          phoneNumberFieldErrorMessage,
                          confirmPasswordFieldErrorMessage,
                          isFormValid,
                          termsAgreed,
                        )
                        ,
                child: Container(
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
              );
            },
          ),
          SizedBox(height: 18.h),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallText(text: "Already have an account?"),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap:
                      () => Navigator.pushNamed(context, AppRoutes.loginPage),
                  child: SmallText(
                    text: "Log in",
                    color: Colors.lightBlueAccent.shade400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onSignup(
    BuildContext context,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String password,
    String confirmPassword,
    ValueNotifier<String?> emailFieldErrorMessage,
    ValueNotifier<String?> passwordFieldErrorMessage,
    ValueNotifier<String?> firstNameFieldErrorMessage,
    ValueNotifier<String?> lastNameFieldErrorMessage,
    ValueNotifier<String?> phoneNumberFieldErrorMessage,
    ValueNotifier<String?> confirmPasswordFieldErrorMessage,
    ValueNotifier isFormValid,
    ValueNotifier termsAgreed,
  ) {
    if (firstName.isEmpty) {
      firstNameFieldErrorMessage.value = "First name cannot be empty";
    }

    if (lastName.isEmpty) {
      lastNameFieldErrorMessage.value = "Last name cannot be empty";
    }
    if (email.isEmpty) {
      emailFieldErrorMessage.value = "Email cannot be empty";
    }
    if (GetUtils.isEmail(email) == false) {
      emailFieldErrorMessage.value = "Please enter a valid email address";
    }
    if (phoneNumber.isEmpty) {
      phoneNumberFieldErrorMessage.value = "Phone number cannot be empty";
    }
    if (password.isEmpty) {
      passwordFieldErrorMessage.value = "Password cannot be empty";
    }
    print(termsAgreed.value);
    print(isFormValid.value);

    if (isFormValid.value == true && termsAgreed.value == true) {
      BlocProvider.of<RegisterBloc>(context).add(
        Register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );
    }
  }
}
