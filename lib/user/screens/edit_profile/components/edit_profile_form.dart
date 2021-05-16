import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/auth/models/user_model.dart';
import 'package:zaloum_for_shopping/auth/providers/user_provider.dart';
import 'package:zaloum_for_shopping/user/components/custom_surfix_icon.dart';
import 'package:zaloum_for_shopping/user/components/default_button.dart';
import 'package:zaloum_for_shopping/user/components/form_error.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String userName;
  String userEmail;
  String phoneNumber; 
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      UserModel userModel = value.currentUser;
      if (userModel == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildUserNameFormField(userModel),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildUserEmailFormField(userModel),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPhoneNumberFormField(userModel),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildAddressFormField(userModel),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(40)),
              DefaultButton(
                text: "Edit",
                press: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    userModel.userName = userName;
                    userModel.userEmail = userEmail;
                    userModel.phone = phoneNumber;
                    userModel.address = address;
                    Provider.of<UserProvider>(context, listen: false)
                        .updateUser(userModel);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      }
    });
  }

  TextFormField buildAddressFormField(UserModel userModel) {
    return TextFormField(
      initialValue: userModel.address ?? '',
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        address=value;
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField(UserModel userModel) {
    return TextFormField(
      initialValue: userModel.phone ?? '',
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        phoneNumber=value;
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildUserEmailFormField(UserModel userModel) {
    return TextFormField(
      initialValue: userModel.userEmail ?? '',
      onSaved: (newValue) => userEmail = newValue,
      onChanged: (value) {
        userEmail=value;
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField(UserModel userModel) {
    return TextFormField(
      initialValue: userModel.userName ?? '',
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        userName=value;
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
