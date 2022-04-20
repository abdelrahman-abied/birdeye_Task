import 'package:birdeye_task/utils/app_providers.dart';
import 'package:birdeye_task/utils/app_route.dart';
import 'package:birdeye_task/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeView.route,
        routes: appRoutes(context),
      ),
    );
  }
}
