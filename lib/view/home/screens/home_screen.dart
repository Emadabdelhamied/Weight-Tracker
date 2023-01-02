import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/weight.dart';
import '../widgets/home_card.dart';
import 'add_weight.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Weight Tracker',
            style: GoogleFonts.akronim(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w200)),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: WeightRepository().getWeights(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  String date = data['date'].toString();
                  return HomeCard(
                    date:
                        '${date.split('T')[0]} : ${date.split('T')[1].substring(0, 8)}',
                    weight: data['weight'].toString(),
                  );
                }).toList(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddWeight())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
