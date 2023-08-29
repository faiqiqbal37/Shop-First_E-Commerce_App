import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'wishlist_viewmodel.dart';

class WishlistView extends StackedView<WishlistViewModel> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WishlistViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  WishlistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WishlistViewModel();
}
