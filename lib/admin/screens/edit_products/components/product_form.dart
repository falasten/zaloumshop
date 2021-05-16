import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/providers/category_provider.dart';
import '../../../../constants.dart';
import 'package:zaloum_for_shopping/admin/components/custom_surfix_icon.dart';
import 'package:zaloum_for_shopping/admin/components/default_button.dart';
import 'package:zaloum_for_shopping/admin/components/form_error.dart';
import '../../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/product_provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';

class EditProductsForm extends StatefulWidget {
  Product product;
  EditProductsForm({this.product});
  @override
  _EditProductsFormState createState() => _EditProductsFormState();
}

class _EditProductsFormState extends State<EditProductsForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String title;
  String description;
  double price;
  String dropDownValue;
  
@override
void initState() { 
  super.initState();
  if(widget.product.category!=null){
      dropDownValue=widget.product.category;
    }
}
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
      if (dropDownValue == null) {
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                title: Text(
                  "Error",
                  style: GoogleFonts.oswald(),
                ),
                content: Text('please enter category')));
      } else {
        widget.product.title = title;
        widget.product.price = price;
        widget.product.description = description;
        widget.product.category = dropDownValue;
        Provider.of<ProductProvider>(context, listen: false)
            .updateProduct(widget.product);
        Navigator.of(context).pop();
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider catProvider =
        Provider.of<CategoryProvider>(context, listen: false);
        List<String> items = [];
    for (Category listItem in catProvider.allActiveCategories) {
      items.add(listItem.title);
    } 
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTitleFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDescriptionFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPriceFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCategoryFormField(items),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: "edit product",
            press: () {
              submitForm(context);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: "delete product",
            press: () {
              Provider.of<ProductProvider>(context)
            .deleteProduct(widget.product.documentId);
            Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPriceFormField() {
    return TextFormField(
      initialValue: widget.product.price.toString(),
      keyboardType: TextInputType.number,
      onSaved: (newValue) {
        price = double.parse(newValue);
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPPriceNullError);
        }
        price = double.parse(value);
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPPriceNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Price",
        hintText: "Enter product price",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/receipt.svg", svgColor: Color(0xFFB6B6B6)),
      ),
    );
  }
  // RaisedButton buildSelectColorsButton() {
  //   return RaisedButton(
  //     elevation: 3.0,
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             titlePadding: const EdgeInsets.all(0.0),
  //             contentPadding: const EdgeInsets.all(0.0),
  //             content: SingleChildScrollView(
  //               child: MaterialPicker(
  //                 pickerColor: Color(0xffE0F7FA),
  //                 onColorChanged: (color) {
  //                   // colorsList.add(color.toString());
  //                   // provider.setColorList(colorsList);
  //                   // print(colorsList);
  //                 },
  //                 enableLabel: true,
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //     child: SizedBox(
  //       width: SizeConfig.screenWidth * 0.5,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Icon(Icons.color_lens),
  //           SizedBox(width: 10),
  //           Text('select colors'),
  //         ],
  //       ),
  //     ),
  //     color: Colors.orangeAccent,
  //     // textColor: useWhiteForeground(Colors.limeAccent)
  //     //     ? const Color(0xffffffff)
  //     //     : const Color(0xff000000),
  //   );
  // }

  DropdownButtonFormField buildCategoryFormField(List<String> items) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: "Select Category",
        labelText: "Category",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      value: widget.product.category,
      onChanged: (value) {
        setState(() {
          dropDownValue = value;
        });
      },
      items: items
          .map((categoryTitle) => DropdownMenuItem(
              value: categoryTitle, child: Text("$categoryTitle")))
          .toList(),
    );
  }

  TextFormField buildDescriptionFormField() {
    return TextFormField(
      initialValue: widget.product.description,
      onSaved: (newValue) {
        description = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPDescNullError);
        }
        description = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPDescNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Enter description",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/receipt.svg", svgColor: Color(0xFFB6B6B6)),
        //suffixStyle: TextStyle(color: Colors.amber)
      ),
    );
  }

  TextFormField buildTitleFormField() {
    return TextFormField(
      initialValue: widget.product.title,
      onSaved: (newValue) {
        title = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPTitleNullError);
        }
        title = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPTitleNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Title",
        hintText: "Enter product title",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/receipt.svg", svgColor: Color(0xFFB6B6B6)),
        //suffixStyle: TextStyle(color: Colors.amber)
      ),
    );
  }
}
