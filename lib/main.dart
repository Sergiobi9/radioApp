import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:radio_app/core/ui/theme/app_theme.dart';
import 'package:radio_app/init/app_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GoRouter appRoutes = await AppInit.init();
  runApp(MyApp(
    appRoutes: appRoutes,
  ));
}

class MyApp extends StatefulWidget {
  GoRouter appRoutes;
  MyApp({super.key, required this.appRoutes});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Radio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Radio App",
        theme: AppTheme.lightTheme,
        themeAnimationCurve: Curves.bounceIn,
        routerConfig: widget.appRoutes,
      ),
    );
  }
}
