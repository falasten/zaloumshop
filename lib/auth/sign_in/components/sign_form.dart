import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaloum_for_shopping/auth/components/custom_surfix_icon.dart';
import 'package:zaloum_for_shopping/auth/components/default_button.dart';
import 'package:zaloum_for_shopping/auth/components/form_error.dart';
// import 'package:zaloum_for_shopping/auth/helper/keyboard.dart';
import 'package:zaloum_for_shopping/auth/forgot_password/forgot_password_screen.dart';
import 'package:zaloum_for_shopping/auth/login_success/login_success_screen.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

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
  setEmail(value) {
    this.email = value;
  }

  setPassword(value) {
    this.password = value;
  }

  loginByEmailAndPassword(BuildContext context) {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save(); 
      FireAuthHelper.fireAuthHelper
          .loginByEmailAndPassword(email, password)
          .whenComplete(() async {
        bool isLogged = await FireAuthHelper.fireAuthHelper.checkUserLogin();
        if (isLogged == true) {
          Navigator.pushNamed(context, LoginSuccessScreen.routeName);
        } else {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                  title: Text(
                    "Login Error",
                    style: GoogleFonts.oswald(),
                  ),
                  content:
                      Text('Email Or Password is wrong, please try again')));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              loginByEmailAndPassword(context);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => this.setPassword(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => this.setEmail(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
