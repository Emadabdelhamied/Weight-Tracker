import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);
  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.cyan,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: GoogleFonts.akronim(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w200)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
