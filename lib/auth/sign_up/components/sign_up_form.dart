import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaloum_for_shopping/auth/models/user_model.dart';
import 'package:zaloum_for_shopping/auth/components/custom_surfix_icon.dart';
import 'package:zaloum_for_shopping/auth/components/default_button.dart';
import 'package:zaloum_for_shopping/auth/components/form_error.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';
import 'package:zaloum_for_shopping/auth/sign_in/sign_in_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String email;
  String password;
  String conformPassword;
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
        error='';
      });
  }

  setEmail(value) {
    this.email = value;
  }

  setPassword(value) {
    this.password = value;
  }

setConfirm(value) {
    this.conformPassword = value;
  }

  signUpByEmailAndPassword(BuildContext context) {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save();
      UserModel userModel = UserModel(userEmail: email, isAdmin: false, password: password);
      FireAuthHelper.fireAuthHelper
          .registerByEmailAndPassword(userModel)
          .whenComplete(() async {
           //String isDone = await  Provider.of<UserProvider>(context, listen: false).isRegisterDone;
           String isDone = await FireAuthHelper.fireAuthHelper.checkRegister();
        if (isDone == 'true') {
          Navigator.pushNamed(context, SignInScreen.routeName);
        } else {
           showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                  title: Text(
                    "Register Error",
                    style: GoogleFonts.oswald(),
                  ),
                  content: Text('This email is already exist')));
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
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              signUpByEmailAndPassword(context);
              //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              // if (formKey.currentState.validate()) {
              //   formKey.currentState.save();
              //   // if all are valid then go to success screen
                
              // }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => this.setConfirm(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: kMatchPassError);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        password = value;
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
