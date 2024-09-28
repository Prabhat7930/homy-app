import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homy/core/routes/app_routes.dart';
import 'package:homy/core/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const Homy());
}

class Homy extends StatelessWidget {
  const Homy({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'The Homy',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
