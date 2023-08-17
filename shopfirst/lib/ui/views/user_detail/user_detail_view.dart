import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 48.0,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with user image URL
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: viewModel.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: viewModel.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: viewModel.addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: viewModel.phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Save'),
            ),
            SizedBox(height: 25,),
            InkWell(onTap: () => {},
            child: Text("Change Password", textAlign: TextAlign.center),)
          ],
        ),
      ),
    );
  }

  @override
  UserDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailViewModel();
}
