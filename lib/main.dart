import 'package:bank_core/provider/general_provider.dart';
import 'package:bank_core/provider/user_provider.dart';
import 'package:bank_core/screens/auth/check-biometric.dart';
import 'package:bank_core/screens/bank-transfer-page/bank-transfer-page.dart';
import 'package:bank_core/screens/bonus-credit/add-fiends/add-fiends-number.dart';
import 'package:bank_core/screens/bonus-credit/add-fiends/add-friend.dart';
import 'package:bank_core/screens/bonus-credit/bonus-credit.dart';
import 'package:bank_core/screens/bonus-credit/facebook-auth.dart';
import 'package:bank_core/screens/otp/otp-page.dart';
import 'package:bank_core/screens/payment-page/close-payment-page.dart';
import 'package:bank_core/screens/profile-page/address/add-page.dart';
import 'package:bank_core/screens/auth/forgot.dart';
import 'package:bank_core/screens/profile-page/bank-account-page/add-bank-account-page.dart';
import 'package:bank_core/screens/auth/login.dart';
import 'package:bank_core/screens/profile-page/benefit-ratio/benefit-ratio.dart';
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
import 'package:bank_core/screens/profile-page/information/add-information-page.dart';
import 'package:bank_core/screens/profile-page/profile-detail-page.dart';
import 'package:bank_core/screens/profile-page/information/show-detail.dart';
import 'package:bank_core/screens/profile-page/profile-page.dart';
import 'package:bank_core/screens/auth/register-page.dart';
import 'package:bank_core/screens/profile-page/settings-page/settings-page.dart';
import 'package:bank_core/screens/profile-page/support-service/support-service.dart';
import 'package:bank_core/screens/profile-page/support-service/to-contact.dart';
import 'package:bank_core/screens/profile-page/who-type/who-type.dart';
import 'package:bank_core/screens/shop-page/company/company-information.dart';
import 'package:bank_core/screens/shop-page/product/product-information.dart';
import 'package:bank_core/screens/qpay/qpay.dart';
import 'package:bank_core/screens/splash/splash.dart';
import 'package:bank_core/screens/profile-page/term/term.dart';
import 'package:bank_core/screens/profile-page/who-type/add-who-type-page.dart';
import 'package:bank_core/screens/transaction-history/history-page.dart';
import 'package:bank_core/services/dialog.dart';
import 'package:bank_core/services/navigation.dart';
import 'package:bank_core/services/notification.dart';
import 'package:bank_core/utils/utils.dart';
import 'package:bank_core/widgets/dialog_manager/colors.dart';
import 'package:bank_core/widgets/dialog_manager/dialog_manager.dart';
import 'package:bank_core/widgets/theme/custom-theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  runApp(const MyApp());
}

GetIt locator = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int invalidTokenCount = 0;

  static setInvalidToken(int count) {
    invalidTokenCount = count;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T-Wallet',
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => GeneralProvider()),
        ],
        child: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            return MaterialApp(
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              themeMode: Provider.of<UserProvider>(context).themeMode,
              builder: (context, widget) => Navigator(
                onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => DialogManager(
                      child: Listener(
                    onPointerDown: (PointerEvent details) async {
                      print("CLICK=>");
                      DateTime now =
                          DateTime.now().add(Duration(minutes: expireLogOut));
                      ;
                      String formattedDate =
                          DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
                      UserProvider().setApiDateExpire(formattedDate);
                    },
                    child: loading(context, widget),
                  )),
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
                    OtpVerifyPageArguments arguments =
                        settings.arguments as OtpVerifyPageArguments;
                    return MaterialPageRoute(builder: (context) {
                      return OtpVerifyPage(
                        username: arguments.username,
                        data: arguments.data,
                      );
                    });
                  case LoanPage.routeName:
                    LoanPageArguments arguments =
                        settings.arguments as LoanPageArguments;
                    return MaterialPageRoute(builder: (context) {
                      return LoanPage(
                        listenController: arguments.listenController,
                        maxRate: arguments.maxRate,
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
                  case ChangePasswordPage.routeName:
                    ChangePasswordPageArguments arguments =
                        settings.arguments as ChangePasswordPageArguments;
                    return MaterialPageRoute(builder: (context) {
                      return ChangePasswordPage(
                        isForgot: arguments.isForgot,
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
                  case BankTransferPage.routeName:
                    BankTransferPageArguments arguments =
                        settings.arguments as BankTransferPageArguments;
                    return MaterialPageRoute(builder: (context) {
                      return BankTransferPage(
                        code: arguments.code,
                        totalPayAmount: arguments.totalPayAmount,
                      );
                    });
                  case BenefitRatio.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const BenefitRatio();
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
                    QpayPageArguments arguments =
                        settings.arguments as QpayPageArguments;
                    return MaterialPageRoute(builder: (context) {
                      return QpayPage(
                        amount: arguments.amount,
                        loanId: arguments.loanId,
                        loanPaybackGraphId: arguments.loanPaybackGraphId,
                      );
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

                  case ProductInformation.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const ProductInformation();
                    });
                  case CompanyInformation.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const CompanyInformation();
                    });
                  case SupportService.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const SupportService();
                    });
                  case ToContact.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const ToContact();
                    });
                  case FaqPage.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const FaqPage();
                    });
                  case ShowDetail.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const ShowDetail();
                    });
                  case WhoType.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const WhoType();
                    });
                  case AddFriends.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const AddFriends();
                    });
                  case UserFaceBookAuth.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const UserFaceBookAuth();
                    });
                  case BonusCredit.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const BonusCredit();
                    });
                  case InviteFriends.routeName:
                    return MaterialPageRoute(builder: (context) {
                      return const InviteFriends();
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
                        loanId: arguments.loanId,
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
                        code: arguments.code,
                        loanDate: arguments.loanDate,
                        totalPayAmount: arguments.totalPayAmount,
                        loanResidual: arguments.loanResidual,
                        loanId: arguments.loanId,
                        listenController: arguments.listenController,
                        loanPaybackGraphId: arguments.loanPaybackGraphId,
                      );
                    });
                  case ClosePaymentPage.routeName:
                    ClosePaymentPageArguments arguments =
                        settings.arguments as ClosePaymentPageArguments;
                    return MaterialPageRoute(builder: (context) {
                      return ClosePaymentPage(
                        todayAmount: arguments.todayAmount,
                        closeAmount: arguments.closeAmount,
                        code: arguments.code,
                        loanDate: arguments.loanDate,
                        totalPayAmount: arguments.totalPayAmount,
                        loanResidual: arguments.loanResidual,
                        loanId: arguments.loanId,
                        listenController: arguments.listenController,
                        loanPaybackGraphId: arguments.loanPaybackGraphId,
                      );
                    });
                  default:
                    return MaterialPageRoute(
                      builder: (_) => const MainPage(),
                    );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

Widget loading(BuildContext context, widget) {
  bool shouldPop = false;

  return WillPopScope(
    child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Container(
        color: backgroundColor,
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
