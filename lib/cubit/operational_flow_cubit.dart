import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'operational_flow_state.dart';

class OperationalFlowCubit extends Cubit<OperationalFlowState> {
  OperationalFlowCubit() : super(const OperationalFlowInitial());

  void setSelectedOperationalFlow(String newRoute) =>
      emit(OperationalFlowChanged(newRoute));
}
