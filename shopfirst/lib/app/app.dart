import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopfirst/services/authentication_service.dart';
import 'package:shopfirst/services/order_service.dart';
import 'package:shopfirst/services/product_service.dart';
import 'package:shopfirst/services/user_service.dart';
import 'package:shopfirst/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:shopfirst/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:shopfirst/ui/views/home/home_view.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopfirst/ui/views/startup/startup_view.dart';
import 'package:shopfirst/ui/views/login_screen/login_screen_view.dart';
import 'package:shopfirst/ui/views/signup_screen/signup_screen_view.dart';
import 'package:shopfirst/ui/views/products/products_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(page: SignupScreenView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ProductsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: OrderService),
    LazySingleton(classType: ProductService),
    LazySingleton(classType: UserService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
