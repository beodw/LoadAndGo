import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/Orders/order.dart';
import '../repository/order_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepo orderRepo;
  OrdersState ordersState = OrdersInitial();

  OrdersCubit({required this.orderRepo}) : super(OrdersInitial());

  //Function to get initial orders when app loads
  Future<void> getOrders() async {
    emit(OrdersLoading());
    final List<Order> loadedOrders = await orderRepo.fetchOrders();
    emit(OrdersLoaded(loadedOrders: loadedOrders, numSelected: 0));
  }

  //Function to set a list of orders to selected
  void selectAll(List<String> idList) {
    int newNumSelected = state.numSelected;
    for (String id in idList) {
      for (Order order in state.orders) {
        if (order.id == id) {
          if (!order.isSelected) {
            order.isSelected = true;
            newNumSelected += 1;
          }
        }
      }
    }
    OrdersLoaded newState =
        OrdersLoaded(loadedOrders: state.orders, numSelected: newNumSelected);
    emit(newState);
  }

  //Function to set an order to selected or unselected
  void toggleSelectedOrder(String id) {
    //search for specified order based on id and toggle its state
    //@todo implement binary search for better performance
    int numSelected = 0;
    for (Order order in ordersState.orders) {
      if (order.id == id) {
        if (order.isSelected) {
          numSelected = state.numSelected - 1;
        } else {
          numSelected = state.numSelected + 1;
        }
        order.isSelected = !order.isSelected;
      }
    }
    OrdersLoaded newState =
        OrdersLoaded(loadedOrders: state.orders, numSelected: numSelected);
    emit(newState);
  }

//Function to set all orders isSelected field to false
  void clearSelected() {
    for (Order order in ordersState.orders) {
      if (order.isSelected) {
        order.isSelected = false;
      }
    }
    OrdersLoaded newState =
        OrdersLoaded(loadedOrders: state.orders, numSelected: 0);
    emit(newState);
  }

//Override onChange so current value emitted can be stored
//useful for toggling a single order and emitting a new list
  @override
  void onChange(Change<OrdersState> change) {
    super.onChange(change);
    ordersState = change.nextState;
  }
}
