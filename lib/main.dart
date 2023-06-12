import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/check-biometric.dart';
import 'package:bank_core/screens/otp/otp-page.dart';
import 'package:bank_core/screens/profile-page/address/add-page.dart';
import 'package:bank_core/screens/auth/forgot.dart';
import 'package:bank_core/screens/profile-page/bank-account-page/add-bank-account-page.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/screens/profile-page/change-email/change-email-page.dart';
import 'package:bank_core/screens/profile-page/change-password/change-password.dart';
import 'package:bank_core/screens/profile-page/change-phone/change-phone-page.dart';
import 'package:bank_core/screens/profile-page/faq/faq.dart';
import 'package:bank_core/screens/loan/loan-detail-page.dart';
import 'package:bank_core/screens/loan/loan-page.dart';
import 'package:bank_core/screens/loan/loan-schedule-page.dart';
import 'package:bank_core/screens/main-page.dart';
import 'package:bank_core/screens/notification-page/notification-page.dart';
import 'package:bank_core/screens/payment-page/payment-page.dart';
import 'package:bank_core/screens/profile-page/bank-account-page/bank-accounts.dart';
import 'package:bank_core/screens/profile-page/address/address.dart';
import 'package:bank_core/screens/profile-page/add-information-page.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/screens/auth/register-page.dart';
import 'package:bank_core/screens/profile-page/settings-page/settings-page.dart';
import 'package:bank_core/screens/qpay/qpay.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/screens/profile-page/term/term.dart';
import 'package:bank_core/screens/profile-page/add-who-type-page.dart';
import 'package:bank_core/screens/transaction-history/history-page.dart';
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
        title: 'T-Wallet',
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
                title: 'T-Wallet',
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
                    case OtpVerifyPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const OtpVerifyPage();
                      });
                    case LoanPage.routeName:
                      LoanPageArguments arguments =
                          settings.arguments as LoanPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return LoanPage(
                          listenController: arguments.listenController,
                        );
                      });
                    case AddWhoTypePage.routeName:
                      AddWhoTypePageArguments arguments =
                          settings.arguments as AddWhoTypePageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return AddWhoTypePage(
                          listenController: arguments.listenController,
                        );
                      });
                    case MainPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      });

                    case AddInformationPage.routeName:
                      AddInformationPageArguments arguments =
                          settings.arguments as AddInformationPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return AddInformationPage(
                          listenController: arguments.listenController,
                        );
                      });
                    case LoginScreen.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      });
                    case ChangePhonePage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ChangePhonePage();
                      });
                    case ChangeEmailPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ChangeEmailPage();
                      });
                    case CheckBiometric.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const CheckBiometric();
                      });
                    case SettingsPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const SettingsPage();
                      });
                    case ChangePasswordPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ChangePasswordPage();
                      });
                    case ForgotPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ForgotPage();
                      });
                    case ProfileDetailPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const ProfileDetailPage();
                      });
                    case BankAccounts.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const BankAccounts();
                      });
                    case HistoryPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const HistoryPage();
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
                      AddAddressPageArguments arguments =
                          settings.arguments as AddAddressPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return AddAddressPage(
                          listenController: arguments.listenController,
                        );
                      });
                    case AddAddress.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const AddAddress();
                      });
                    case NotificationPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const NotificationPage();
                      });
                    case FaqPage.routeName:
                      return MaterialPageRoute(builder: (context) {
                        return const FaqPage();
                      });
                    case TermofPolicyPage.routeName:
                      return PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const TermofPolicyPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      );
                    case LoanDetailPage.routeName:
                      LoanDetailPageArguments arguments =
                          settings.arguments as LoanDetailPageArguments;
                      return MaterialPageRoute(builder: (context) {
                        return LoanDetailPage(
                          id: arguments.id,
                          listenController: arguments.listenController,
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
                          listenController: arguments.listenController,
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
