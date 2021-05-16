import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/providers/category_provider.dart';
import '../../../../constants.dart';
import 'package:zaloum_for_shopping/admin/components/custom_surfix_icon.dart';
import 'package:zaloum_for_shopping/admin/components/default_button.dart';
import 'package:zaloum_for_shopping/admin/components/form_error.dart';
import '../../../../size_config.dart';

class AddCategoriesForm extends StatefulWidget {
  @override
  _AddCategoriesFormState createState() => _AddCategoriesFormState();
}

class _AddCategoriesFormState extends State<AddCategoriesForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String title;
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
submitForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
        Provider.of<CategoryProvider>(context, listen: false).addNewCategory();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: false); 
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildCategoryFormField(provider),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: "add category",
            press: () {
              submitForm(context);
            },
          ),
        ],
      ),
    );
  }
  
  TextFormField buildCategoryFormField(CategoryProvider provider) {
    return TextFormField(
      onSaved: (newValue) {
        provider.setTitle(newValue);
      } ,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPCatNullError);
        }
        provider.setTitle(value);
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPCatNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Category",
        hintText: "Enter category",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/receipt.svg", svgColor: Color(0xFFB6B6B6)),
        //suffixStyle: TextStyle(color: Colors.amber)
      ),
    );
  }
}
