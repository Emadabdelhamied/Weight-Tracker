import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custom_button.dart';
import '../../../logic/weight/weight_cubit.dart';
import '../../sign_in/widgets/input_field.dart';

class AddWeight extends StatelessWidget {
  AddWeight({Key? key}) : super(key: key);
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InputField(
                label: 'Add your current weight',
                obscureText: false,
                controller: weightController,
                sizeoflabel: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150,
              child: CustomButton(
                text: 'submit',
                ontap: () async {
                  Navigator.pop(context);
                  await context.read<WeightCubit>().registerNewWeight(
                      newWeight: double.parse(weightController.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
