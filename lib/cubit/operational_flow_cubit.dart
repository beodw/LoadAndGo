import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lng/models/OperationalFlows/operational_flow.dart';
import '../repository/operational_flows_repo.dart';

part 'operational_flow_state.dart';

///Cubit to store selected operational flow
///Implemented as string initialized when creating the cubit
///@todo implement as separate state classes and pull values from backend instead.
class OperationalFlowCubit extends Cubit<OperationalFlowState> {
  final OperationalFlowsRepo flowRepo;
  OperationalFlowState flowState = OperationalFlowsInit();

  OperationalFlowCubit({required this.flowRepo})
      : super(OperationalFlowsInit());

  void setSelectedOperationalFlow(String operationalFlow) => emit(
        OperationalFlowLoaded(
          selectedFlow: operationalFlow,
          flows: state.operationalFlows,
        ),
      );

  void getFlows() async {
    emit(OperationalFlowLoading());
    final List<OperationalFlow> flows = await flowRepo.fetchFlows();
    emit(
      OperationalFlowLoaded(
        selectedFlow: flows.first.code,
        flows: flows,
      ),
    );
  }
}
