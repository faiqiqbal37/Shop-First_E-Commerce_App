import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:stacked/stacked.dart';

import 'login_screen_viewmodel.dart';

class LoginScreenView extends StackedView<LoginScreenViewModel> {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: Text("Login Screen", style: TextStyle(fontSize: 30)),
              ),
              Container(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      Container(
                        child: TextFormField(
                          controller: viewModel.emailController,
                          decoration: InputDecoration(
                            labelText: "Please Enter Email",
                            labelStyle: TextStyle(fontSize: 20),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                        margin: EdgeInsets.all(15),
                      ),
                      Container(
                        child: TextFormField(
                          controller: viewModel.passwordController,
                          decoration: InputDecoration(
                            labelText: "Please Enter Password",
                            labelStyle: TextStyle(fontSize: 20),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                        margin: EdgeInsets.all(15),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel
                                      .signInWithEmailAndPassword(
                                          viewModel.emailController.text,
                                          viewModel.passwordController.text)
                                      .then((value) => {
                                            viewModel.navigationController
                                                .navigateToHomeView()
                                          });
                                },
                                child: Text("Login"),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.navigationController
                                      .navigateToSignupScreenView();
                                },
                                child: Text("Sign Up"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(viewModel.errorMessage.toString()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginScreenViewModel();
}
