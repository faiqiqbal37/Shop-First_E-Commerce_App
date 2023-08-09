import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.bottomsheets.dart';
import 'package:shopfirst/app/app.dialogs.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.locator.dart';
import 'firebase_options.dart';

import 'app/app.router.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();
    runApp(const MainApp());
  } catch (e) {
    print("The Initilaiziation Error Is: $e");
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
