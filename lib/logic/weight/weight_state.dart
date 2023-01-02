part of 'weight_cubit.dart';

@immutable
abstract class WeightState {}

class WeightInitial extends WeightState {}

class RegisterNewWeightLoadingState extends WeightState {}

class RegisterNewWeightSccuessState extends WeightState {}

class RegisterNewWeightErrorState extends WeightState {}

// get weight states

class GetWeightLoadingState extends WeightState {}

class GetWeightSccuessState extends WeightState {}

class GetWeightErrorState extends WeightState {}
