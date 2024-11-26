import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_gluon/constant/route_constant.dart';
import 'package:test_flutter_gluon/screen/choose_screen.dart';
import 'package:test_flutter_gluon/screen/dart_oop1_screen.dart';
import 'package:test_flutter_gluon/screen/widget_test1_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RouteConstant().choose,
      builder: (BuildContext context, GoRouterState state) {
        return const ChooseScreen();
      },
    ),
    GoRoute(
      path: RouteConstant().widgetTest1,
      builder: (BuildContext context, GoRouterState state) {
        return  const WidgetTest1Screen();
      },
    ),
    GoRoute(
      path: RouteConstant().dartOOPTest1,
      builder: (BuildContext context, GoRouterState state) {
        return DartOOP1Screen();
      },
    ),
  ],
);
