import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shopfirst/ui/common/app_colors.dart';
import 'package:shopfirst/ui/common/ui_helpers.dart';
import 'package:shopfirst/Widgets/Navigation_Drawer.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop First")),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.cyan,
            height: 90,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    height: 180,
                  ),
                  Container(
                    color: Colors.red,
                    height: 245,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 245,
                  ),
                  Container(
                    color: Colors.purple,
                    height: 245,
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
