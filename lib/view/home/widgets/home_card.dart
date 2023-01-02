import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  final String date;
  final String weight;
  const HomeCard({super.key, required this.date, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          color: Colors.cyan,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Date : $date',
                style: GoogleFonts.aladin(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200)),
            const SizedBox(
              height: 20,
            ),
            Text('Weight : $weight',
                style: GoogleFonts.akronim(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}
