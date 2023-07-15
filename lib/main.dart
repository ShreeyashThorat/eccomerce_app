import 'package:ecommerce_app/Internetbloc/internet_connnectivity_bloc_bloc.dart';
import 'package:ecommerce_app/auth/login/bloc/login_bloc_bloc.dart';
import 'package:ecommerce_app/auth/login/login.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/pages/dashboard/cubit/navigation_cubit.dart';
import 'package:ecommerce_app/pages/dashboard/dashboard.dart';
import 'package:ecommerce_app/pages/home/category%20cubit/category_cubit.dart';
import 'package:ecommerce_app/pages/home/product%20by%20category/product_by_category_bloc.dart';
import 'package:ecommerce_app/pages/home/product%20cubit/product_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnnectivityBlocBloc(),
        ),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => ProductByCategoryBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ecommerce App",
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () =>
            FirebaseAuth.instance.authStateChanges().listen((User? user) async {
              if (user == null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => LoginBlocBloc(),
                              child: const LoginScreen(),
                            )),
                    (Route<dynamic> route) => false);
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => NavigationCubit(),
                              child: const Dashboard(),
                            )),
                    (Route<dynamic> route) => false);
              }
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfffef6dd),
      body: Center(
        child: Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/gif/splash_screen.gif")),
      ),
    );
  }
}
