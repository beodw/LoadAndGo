part of 'operational_flow_cubit.dart';

abstract class OperationalFlowState extends Equatable {
  final String selectedOperationalFlow;
  final List<OperationalFlow> operationalFlows;

  const OperationalFlowState(
      this.selectedOperationalFlow, this.operationalFlows);

  @override
  List<Object> get props => [selectedOperationalFlow, operationalFlows];
}

class OperationalFlowsInit extends OperationalFlowState {
  OperationalFlowsInit() : super('', []);
}

class OperationalFlowLoading extends OperationalFlowState {
  OperationalFlowLoading() : super('', []);
}

class OperationalFlowLoaded extends OperationalFlowState {
  const OperationalFlowLoaded({
    required String selectedFlow,
    required List<OperationalFlow> flows,
  }) : super(selectedFlow, flows);
}
