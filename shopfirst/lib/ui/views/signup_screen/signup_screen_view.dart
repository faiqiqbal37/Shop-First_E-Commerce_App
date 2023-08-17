import 'package:flutter/material.dart';
import 'package:shopfirst/app/app.router.dart';
import 'package:shopfirst/ui/views/login_screen/login_screen_view.dart';
import 'package:stacked/stacked.dart';

import 'signup_screen_viewmodel.dart';

class SignupScreenView extends StackedView<SignupScreenViewModel> {
  const SignupScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Text("SignUp Screen", style: TextStyle(fontSize: 30)),
                ),
                Container(
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: viewModel.firstNameController,
                          validator: viewModel.validateName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Please Enter First Name",
                            labelStyle: TextStyle(fontSize: 20),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                        TextFormField(
                          validator: viewModel.validateName,
                          controller: viewModel.lastNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Please Enter Last Name",
                            labelStyle: TextStyle(fontSize: 20),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),

                        Container(
                          child: TextFormField(
                            validator: viewModel.validateEmail,
                            controller: viewModel.emailController,
                            keyboardType:TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Please Enter Email",
                              labelStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            validator: viewModel.validatePassword,
                            keyboardType: TextInputType.text,
                            controller: viewModel.passwordController,
                            decoration: InputDecoration(
                              labelText: "Please Enter Password",
                              labelStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            validator: viewModel.validateConfirmPassword,
                            controller: viewModel.confirmPasswordController,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            validator: viewModel.validatePhone,
                            controller: viewModel.phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Please Enter Phone Number",
                              labelStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            validator: viewModel.validateAddress,
                            controller: viewModel.addressController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                              labelText: "Please Enter Your Current Address",
                              labelStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(

                                child: ElevatedButton(
                                  onPressed: () {
                                    print("Button Pressed");
                                    if(viewModel.formKey.currentState!.validate()) {

                                      viewModel
                                          .addUser(userId: viewModel.uuid.v4(),
                                          phone: double.parse(
                                              viewModel.phoneController.text),
                                          password: viewModel.passwordController
                                              .text,
                                          email: viewModel.emailController.text,
                                          address: viewModel.addressController
                                              .text,
                                          firstName: viewModel
                                              .firstNameController.text,
                                          lastName: viewModel.lastNameController
                                              .text).then((value) =>
                                          viewModel.signUpWithEmailAndPassword(
                                              viewModel.emailController.text,
                                              viewModel.passwordController
                                                  .text))
                                          .then((value) =>
                                          viewModel.showSnackbarSignUp(context))
                                          .then((value) =>
                                          viewModel
                                              .navigationController
                                              .clearStackAndShowView(LoginScreenView()));
                                    }
                                    },
                                  style: ButtonStyle(alignment: Alignment.center,),
                                  child: Text("Sign Up"),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            onTap: () => viewModel.navigationController.navigateToLoginScreenView(),
                            child: Text("Back to Login Page", textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignupScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupScreenViewModel();
}
