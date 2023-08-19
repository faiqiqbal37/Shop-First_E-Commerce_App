import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'change_password_viewmodel.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context,
      ChangePasswordViewModel viewModel,
      Widget? child,) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Details'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                TextFormField(
                  validator: viewModel.validatePassword,
                  controller: viewModel.passwordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                ),
                TextFormField(
                  validator: viewModel.validateConfirmPassword,
                  controller: viewModel.confirmController,
                  decoration: InputDecoration(labelText: 'Confirm New Password'),
                ),

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (viewModel.formKey.currentState!.validate())
                    {viewModel.changePassword(viewModel.passwordController.text).then((value) => viewModel.clearFields(context));
                  }},
                  child: Text('Save'),
                ),
                SizedBox(
                  height: 25,
                ),

              ],
            ),
          )
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
