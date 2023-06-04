import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/lending/lend.dart';
import 'package:bank_core/screens/login/login.dart';
import 'package:bank_core/screens/main/main_page.dart';
import 'package:bank_core/screens/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
}

GetIt locator = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bank Core',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => GeneralProvider()),
          ],
          child: Stack(
            children: [
              MaterialApp(
                title: 'Bank Core',
                debugShowCheckedModeBanner: false,
                initialRoute: SplashPage.routeName,
                onGenerateRoute: (RouteSettings settings) {
                  switch (settings.name) {
                    case SplashPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const SplashPage();
                      });
                    case Lending.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const Lending();
                      });
                    case MainPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      });

                    case LoginPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      });

                    default:
                      return MaterialPageRoute(
                        builder: (_) => const MainPage(),
                      );
                  }
                },
              ),
            ],
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool shouldPop = false;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: Container(
          color: Colors.blue,
          child: SafeArea(
            bottom: false,
            top: false,
            child: Stack(
              children: [
                Opacity(
                  opacity: 1,
                  child: Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        widget,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return shouldPop;
      },
    );
  }
}
