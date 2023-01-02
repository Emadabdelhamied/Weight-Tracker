import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custom_button.dart';
import '../../../logic/auth/auth_cubit.dart';
import '../../home/screens/home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthenticationCubit cubit = context.read<AuthenticationCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: CustomButton(
            text: 'Sign in as Anonymous',
            ontap: () {
              cubit.signInAnon();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => const HomePage())));
            },
          ),
        ),
      ),
    );
  }
}
