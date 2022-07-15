// ignore_for_file: must_be_immutable

part of 'merchants_cubit.dart';

abstract class MerchantsState extends Equatable {
  List<Merchant> merchants;
  MerchantsState({required this.merchants});

  @override
  List<Object> get props => [merchants];
}

class MerchantsInitial extends MerchantsState {
  MerchantsInitial() : super(merchants: []);
}

class MerchantsLoading extends MerchantsState {
  MerchantsLoading() : super(merchants: []);
}

class MerchantsLoaded extends MerchantsState {
  MerchantsLoaded({required List<Merchant> merchants})
      : super(merchants: merchants);
}
