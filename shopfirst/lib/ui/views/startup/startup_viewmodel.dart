import 'dart:ui';

import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  final navigationController = locator<NavigationService>();

  void startupNavigation() {
    navigationController.navigateToLoginScreenView();
  }
}
