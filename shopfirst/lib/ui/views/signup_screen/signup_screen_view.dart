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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: viewModel.firstNameController,
                          validator: viewModel.validateName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Please Enter First Name",
                            labelStyle: TextStyle(fontSize: 16),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: viewModel.validateName,
                          controller: viewModel.lastNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Please Enter Last Name",
                            labelStyle: TextStyle(fontSize: 16),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: viewModel.validateEmail,
                          controller: viewModel.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Please Enter Email",
                            labelStyle: TextStyle(fontSize: 16),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: viewModel.validatePassword,
                          obscureText: viewModel.obscureText,
                          keyboardType: TextInputType.text,
                          controller: viewModel.passwordController,
                          decoration: InputDecoration(
                              labelText: "Please Enter Password",
                              labelStyle: TextStyle(fontSize: 16),
                              contentPadding: EdgeInsets.all(20),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    viewModel.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () =>
                                      {viewModel.toggleObscureText()})),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: viewModel.validateConfirmPassword,
                          controller: viewModel.confirmPasswordController,
                          obscureText: viewModel.obscureText,
                          decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(fontSize: 16),
                              contentPadding: EdgeInsets.all(20),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2)),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    viewModel.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () =>
                                      {viewModel.toggleObscureText()})),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: viewModel.validatePhone,
                          controller: viewModel.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Please Enter Phone Number",
                            labelStyle: TextStyle(fontSize: 16),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: viewModel.validateAddress,
                          controller: viewModel.addressController,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            labelText: "Please Enter Your Current Address",
                            labelStyle: TextStyle(fontSize: 16),
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
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
                                  if (viewModel.formKey.currentState!
                                      .validate()) {
                                    viewModel
                                        .addUser(
                                            phone: double.parse(
                                                viewModel.phoneController.text),
                                            password: viewModel
                                                .passwordController.text,
                                            email:
                                                viewModel.emailController.text,
                                            address: viewModel
                                                .addressController.text,
                                            firstName: viewModel
                                                .firstNameController.text,
                                            lastName: viewModel
                                                .lastNameController.text)
                                        .then((value) => viewModel
                                            .signUpWithEmailAndPassword(
                                                viewModel.emailController.text,
                                                viewModel
                                                    .passwordController.text))
                                        .then((value) => viewModel
                                            .showSnackbarSignUp(context))
                                        .then((value) => viewModel
                                            .navigationController
                                            .clearStackAndShowView(
                                                LoginScreenView()));
                                  }
                                },
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                ),
                                child: Text("Sign Up"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Text("Already a User?",
                                    style: TextStyle(fontSize: 16))),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  viewModel.navigationController
                                      .clearStackAndShowView(LoginScreenView());
                                },
                                child: Text(" Login",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue)),
                              ),
                            )
                          ],
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
    );
  }

  @override
  SignupScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupScreenViewModel();
}
