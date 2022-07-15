import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lng/models/merchants/merchant.dart';
import '../repository/merchants_repo.dart';

part 'merchants_state.dart';

class MerchantsCubit extends Cubit<MerchantsState> {
  final MerchantsRepo merchantRepo;
  MerchantsCubit({required this.merchantRepo}) : super(MerchantsInitial());

  void getMerchants() async {
    emit(MerchantsLoading());
    List<Merchant> titles = await merchantRepo.fetchTitles();
    emit(MerchantsLoaded(merchants: titles));
  }
}
