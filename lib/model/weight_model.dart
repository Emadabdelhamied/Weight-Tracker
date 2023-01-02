import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel {
  final double value;
  final String date;

  WeightModel({required this.value, required this.date});

  factory WeightModel.fromSnapShot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return WeightModel(value: data['weight'], date: data['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      "weight": value,
      "date": date,
    };
  }
}
