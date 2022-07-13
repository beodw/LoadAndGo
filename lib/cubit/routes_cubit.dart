import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_state.dart';

class RoutesCubit extends Cubit<String> {
  String currentRoute;
  RoutesCubit({required this.currentRoute}) : super(currentRoute);

  void getRoute() => emit(currentRoute);
  void setRoute(String newRoute) {
    currentRoute = newRoute;
    emit(currentRoute);
  }
}
