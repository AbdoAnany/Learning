import 'package:cms/components/custom_surfix_icon.dart';
import 'package:cms/components/default_button.dart';
import 'package:cms/components/form_error.dart';
import 'package:cms/constants.dart';
import 'package:cms/provider/auth_provider.dart';
import 'package:cms/sign_in/sign_in_screen.dart';
import 'package:cms/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';



class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String user;
  String email;
  String password;
  String school;
  String phone;
  String grade;

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

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserFormField(),
          SizedBox(height: getScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getScreenHeight(20)),
          buildPhoneFormField(),
          SizedBox(height: getScreenHeight(20)),
          buildSchoolFormField(),
          FormError(errors: errors),
          SizedBox(height: getScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: ()async {
              var flag='';
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                flag=await pro.register(user, phone,email, password,school,grade);
                if(flag=='success')
                {
                  Get.to(SignInScreen());
                }

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildUserFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => user = newValue,
      onChanged: (value) {
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
        labelText: "User Name",
        hintText: "Enter your User Name", border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 5,
      ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
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
        labelText: "Email",
        hintText: "Enter your email", border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 5,
      ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
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
        hintText: "Enter your password", border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 5,
      ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
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
        labelText: "Phone",
        hintText: "Enter your  Phone", border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 5,
      ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }
  TextFormField buildSchoolFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => school = newValue,
      onChanged: (value) {
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
        labelText: "School",
        hintText: "Enter your  School", border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: kTextColor),
        gapPadding: 5,
      ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.school),
      ),
    );
  }


}
