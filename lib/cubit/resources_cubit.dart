import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lng/repository/resources_repo.dart';

import '../models/Resources/driver.dart';

part 'resources_state.dart';

class ResourcesCubit extends Cubit<ResourcesState> {
  final ResourcesRepo resourcesRepo;
  ResourcesCubit({required this.resourcesRepo}) : super(ResourcesInitial());

  void fetchTeams() {
    emit(ResourcesLoading());
    List<Driver> pickUpteam = resourcesRepo.getPickUpTeam();
    List<Driver> deliveryTeam = resourcesRepo.getDeliveryTeam();
    emit(ResourcesLoaded(pickUpTeam: pickUpteam, deliveryTeam: deliveryTeam));
  }
}
