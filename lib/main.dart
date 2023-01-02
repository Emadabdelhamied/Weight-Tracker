import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/auth.dart';
import 'data/weight.dart';
import 'logic/auth/auth_cubit.dart';
import 'logic/weight/weight_cubit.dart';
import 'view/home/screens/home_screen.dart';
import 'view/sign_in/screen/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeightCubit>(
            create: (_) => WeightCubit(weightRepository: WeightRepository())),
      ],
      child: MaterialApp(
        title: 'Weight Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 221, 59, 116),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something wrong!!'));
              } else if (snapshot.hasData) {
                // if the user is login
                return const HomePage();
              } else {
                return BlocProvider(
                  create: (context) =>
                      AuthenticationCubit(authentication: Authentication()),
                  child: SignInScreen(),
                );
              }
            }),
      ),
    );
  }
}
