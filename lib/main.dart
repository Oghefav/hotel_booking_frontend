import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/config/route.dart';
import 'package:hotel_booking_app/depencies_injection.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/custom_login/login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/blocs/login/google_login/google_login_bloc.dart';
import 'package:hotel_booking_app/features/auth/presentation/pages/login_screen/login_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await dependenciesInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(create: ((context) => sl<LoginBloc>())),
            BlocProvider<GoogleLoginBloc>(create: ((context) => sl<GoogleLoginBloc>()),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hotel Booking App',
            initialRoute: AppRoutes.loginPage,
            routes: AppRoutes.getRoutes(),
            ),
        );
      },
    );
  }
}
