import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lng/cubit/orders_cubit.dart';
import 'package:lng/repository/operational_flows_repo.dart';
import 'package:lng/repository/resources_repo.dart';
import 'cubit/resources_cubit.dart';
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
    // Material app init.
    return MaterialApp(
      debugShowCheckedModeBanner: debugModeSetting,
      title: 'Load and Go',
      theme: appTheme,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            // Routes cubit init
            BlocProvider(
              create: (context) =>
                  RoutesCubit(currentRoute: '/orders')..getRoute(),
            ),
            // Operational Flows cubit init
            BlocProvider(
              create: (context) =>
                  OperationalFlowCubit(flowRepo: OperationalFlowsRepo())
                    ..getFlows(),
            ),
            // Orders cubit init
            BlocProvider(
              create: (context) => OrdersCubit(
                orderRepo: OrderRepo(),
              )..getOrders(),
            ),
            // Merchants cubit init
            BlocProvider(
              create: (context) => MerchantsCubit(
                merchantRepo: MerchantsRepo(),
              )..getMerchants(),
            ),
            // Resources cubit init
            BlocProvider(
              create: (context) => ResourcesCubit(
                resourcesRepo: ResourcesRepo(),
              )..fetchTeams(),
            ),
          ],
          child: kIsWeb ? const BaseWebLayout() : const BaseMobileLayout(),
        ),
      ),
    );
  }
}
