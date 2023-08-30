import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'user_detail_viewmodel.dart';

class UserDetailView extends StackedView<UserDetailViewModel> {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Details'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: viewModel.authService.userToken!.isLoggedIn
              ? Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16),
                      Text("First Name:",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,), ),
                      TextFormField(
                        validator: viewModel.validateName,
                        controller: viewModel.firstNameController,
                        decoration: InputDecoration(
                            labelText:
                                '${viewModel.authService.userToken?.firstName}'),
                      ),

                      Text("Last Name:",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                      TextFormField(
                        validator: viewModel.validateName,
                        controller: viewModel.lastNameController,
                        decoration: InputDecoration(
                            labelText:
                                '${viewModel.authService.userToken?.lastName}'),
                      ),

                      Text("Address:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                      TextFormField(
                        validator: viewModel.validateAddress,
                        controller: viewModel.addressController,
                        decoration: InputDecoration(
                            labelText:
                                '${viewModel.authService.userToken?.address}'),
                      ),

                      Text("Phone Number:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                      TextFormField(
                        validator: viewModel.validatePhone,
                        controller: viewModel.phoneController,
                        decoration: InputDecoration(
                            labelText:
                                '${viewModel.authService.userToken?.phone}'),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel
                                .updateUser(
                                    userId:
                                        viewModel.authService.userToken!.userId,
                                    phone: viewModel.phoneController.text,
                                    firstname:
                                        viewModel.firstNameController.text,
                                    address: viewModel.addressController.text,
                                    lastname: viewModel.lastNameController.text)
                                .then((value) => viewModel.clearFields());
                          }
                        },
                        child: Text('Save'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () => {
                          viewModel.navigationService
                              .navigateToChangePasswordView()
                        },
                        child: Text("Change Password",
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text("Please Login to Edit Details.",
                          style: TextStyle(fontSize: 18)),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: viewModel
                              .navigationService.navigateToLoginScreenView,
                          child: Text("Login"))
                    ],
                  ),
                )),
    );
  }

  @override
  UserDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailViewModel();
}
