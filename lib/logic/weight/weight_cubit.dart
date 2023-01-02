import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/weight.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightRepository weightRepository;
  WeightCubit({required this.weightRepository}) : super(WeightInitial());

  Future<void> registerNewWeight({required double newWeight}) async {
    emit(RegisterNewWeightLoadingState());
    try {
      final response = await weightRepository.registerNewWeight(newWeight);
      emit(RegisterNewWeightSccuessState());
    } on FirebaseAuthException {
      emit(RegisterNewWeightErrorState());
    } catch (error) {
      print('error');
    }
  }
}
