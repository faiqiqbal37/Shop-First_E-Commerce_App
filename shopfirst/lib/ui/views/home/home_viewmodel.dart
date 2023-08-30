import 'package:shopfirst/app/app.bottomsheets.dart';
import 'package:shopfirst/app/app.dialogs.dart';
import 'package:shopfirst/app/app.locator.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/models/product/product_model.dart';
import 'package:shopfirst/services/cart_service.dart';
import 'package:shopfirst/services/product_service.dart';
import 'package:shopfirst/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final navigationController = locator<NavigationService>();
  final productService = locator<ProductService>();
  final cartService = locator<CartService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<void> getAllProducts() async {
    productService.getAllProducts();
  }

  void openProductItem(String urlId) {
    productService.products.forEach((element) {
      if (element.imageUrl == urlId) {
        navigationController.navigateToProductItemView(product: element);
      }
    });
  }

  void handleCallback() {
    rebuildUi();
  }

  int getProductCountInCart() {
    print("The Count is: ${cartService.cartProductsList.length}");
    return cartService.cartProductsList.length;
  }
}
