import 'package:flutter/material.dart';

class WeightListItem extends StatelessWidget {
  const WeightListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
              Text('data'),
              Text('data'),
            ],
          ),
          const Text('data'),
        ],
      ),
    );
  }
}
