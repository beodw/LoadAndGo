part of 'resources_cubit.dart';

abstract class ResourcesState extends Equatable {
  final List<Driver> pickUpTeam;
  final List<Driver> deliveryTeam;

  const ResourcesState({required this.pickUpTeam, required this.deliveryTeam});

  @override
  List<Object> get props => [pickUpTeam, deliveryTeam];
}

class ResourcesInitial extends ResourcesState {
  ResourcesInitial() : super(pickUpTeam: [], deliveryTeam: []);
}

class ResourcesLoading extends ResourcesState {
  ResourcesLoading() : super(pickUpTeam: [], deliveryTeam: []);
}

class ResourcesLoaded extends ResourcesState {
  const ResourcesLoaded({required pickUpTeam, required deliveryTeam})
      : super(pickUpTeam: pickUpTeam, deliveryTeam: deliveryTeam);
}
