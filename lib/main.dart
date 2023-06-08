import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/add-address-page/add-address-page.dart';
import 'package:bank_core/screens/bank-account-page/add-bank-account-page.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/screens/loan-detail-page/loan-detail-page.dart';
import 'package:bank_core/screens/loan-page/loan-page.dart';
import 'package:bank_core/screens/loan-schedule-page/loan-schedule-page.dart';
import 'package:bank_core/screens/main-page.dart';
import 'package:bank_core/screens/payment-page/payment-page.dart';
import 'package:bank_core/screens/bank-account-page/bank-accounts.dart';
import 'package:bank_core/screens/add-address-page/address.dart';
import 'package:bank_core/screens/profile-page/add-information-page.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/screens/auth/register-page.dart';
import 'package:bank_core/screens/qpay/qpay.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/screens/who-type-page/add-who-type-page.dart';
import 'package:bank_core/screens/who-type-page/who-type-page.dart';
import 'package:bank_core/services/dialog.dart';
import 'package:bank_core/services/navigation.dart';
import 'package:bank_core/widgets/dialog_manager/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
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
                theme:
                    ThemeData(primarySwatch: Colors.grey, fontFamily: "Rubik"),
                builder: (context, widget) => Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) =>
                        DialogManager(child: loading(context, widget)),
                  ),
                ),
                title: 'Bank Core',
                debugShowCheckedModeBanner: false,
                initialRoute: SplashScreen.routeName,
                onGenerateRoute: (RouteSettings settings) {
                  switch (settings.name) {
                    case SplashScreen.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const SplashScreen();
                      });

                    case MainPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      });
                    case LoanPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const LoanPage();
                      });
                    case AddWhoTypePage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const AddWhoTypePage();
                      });
                    case MainPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      });
                    case AddInformationPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const AddInformationPage();
                      });
                    case LoginScreen.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      });
                    case ProfileDetailPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ProfileDetailPage();
                      });
                    case BankAccounts.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const BankAccounts();
                      });
                    case AddBankAccountPage.routeName:
                      AddBankAccountPageArguments arguments =
                          settings.arguments as AddBankAccountPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return AddBankAccountPage(
                          listenController: arguments.listenController,
                        );
                      });
                    case QpayPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const QpayPage();
                      });
                    case ProfilePage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ProfilePage();
                      });
                    case RegisterPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const RegisterPage();
                      });
                    case AddAddressPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const AddAddressPage();
                      });
                    case WhoTypePage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const WhoTypePage();
                      });
                    case AddAddress.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const AddAddress();
                      });
                    case LoanDetailPage.routeName:
                      LoanDetailPageArguments arguments =
                          settings.arguments as LoanDetailPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return LoanDetailPage(
                          id: arguments.id,
                        );
                      });
                    case LoanSchedulePage.routeName:
                      LoanSchedulePageArguments arguments =
                          settings.arguments as LoanSchedulePageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return LoanSchedulePage(
                          id: arguments.id,
                        );
                      });
                    case PaymentPage.routeName:
                      PaymentPageArguments arguments =
                          settings.arguments as PaymentPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return PaymentPage(
                          loanResidual: arguments.loanResidual,
                          id: arguments.id,
                        );
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

Widget loading(BuildContext context, widget) {
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
