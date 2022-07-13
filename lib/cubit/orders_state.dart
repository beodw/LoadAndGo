part of 'orders_cubit.dart';

///Order states.
///Implemented as a set of classes corresponding to initial, loading and loaded states
abstract class OrdersState extends Equatable {
  final List<Order> orders;
  final int numSelected;
  const OrdersState({required this.orders, required this.numSelected});

  @override
  List<Object> get props => [orders, numSelected];
}

class OrdersInitial extends OrdersState {
  OrdersInitial() : super(orders: [], numSelected: 0);
}

class OrdersLoading extends OrdersState {
  OrdersLoading() : super(orders: [], numSelected: 0);
}

class OrdersLoaded extends OrdersState {
  const OrdersLoaded(
      {required List<Order> loadedOrders, required int numSelected})
      : super(orders: loadedOrders, numSelected: numSelected);
}
