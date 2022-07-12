part of 'operational_flow_cubit.dart';

abstract class OperationalFlowState extends Equatable {
  final String selectedOperationalFlow;
  const OperationalFlowState(this.selectedOperationalFlow);

  @override
  List<Object> get props => [];
}

class OperationalFlowInitial extends OperationalFlowState {
  const OperationalFlowInitial({String? newOpertionalFlow})
      : super('pick_up_and_delivery');
}

class OperationalFlowChanged extends OperationalFlowState {
  const OperationalFlowChanged(String selectedOperationalFlow)
      : super(selectedOperationalFlow);
}
