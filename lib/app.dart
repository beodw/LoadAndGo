import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/cubit/orders_cubit.dart';
import 'package:lng/repository/operational_flows_repo.dart';
import 'ui/layouts/web_layout/base_web_layout.dart';
import 'ui/layouts/mobile_layout/base_mobile_layout.dart';
import 'config/app_settings.dart';
import 'config/palette.dart';
import 'cubit/routes_cubit.dart';
import 'cubit/operational_flow_cubit.dart';
import 'repository/order_repo.dart';
import 'repository/merchants_repo.dart';
import 'cubit/merchants_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugModeSetting,
      title: 'Load and Go',
      theme: appTheme,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  RoutesCubit(currentRoute: '/orders')..getRoute(),
            ),
            BlocProvider(
              create: (context) =>
                  OperationalFlowCubit(flowRepo: OperationalFlowsRepo())
                    ..getFlows(),
            ),
            BlocProvider(
              create: (context) => OrdersCubit(
                orderRepo: OrderRepo(),
              )..getOrders(),
            ),
            BlocProvider(
              create: (context) => MerchantsCubit(
                merchantRepo: MerchantsRepo(),
              )..getMerchants(),
            ),
          ],
          child: kIsWeb ? const BaseWebLayout() : const BaseMobileLayout(),
        ),
      ),
    );
  }
}
