import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_task/widgets/bottom_sheets/create_account_bottom_sheet.dart';

import '../custom_elevated_button.dart';
import '../custom_form_field.dart';
import '../custom_text.dart';

class LoginBottomSheet extends StatefulWidget {
  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var courseController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!!!',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff050522)),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Color(0xff050522),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          size: 30,
                          CupertinoIcons.xmark_circle,
                          color: Color(0xffEF5858),
                        )),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                CustomFormField(
                    labelText: "username/email",
                    hintText: "info@example.com",
                    icon: Icons.visibility,
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: _emailValidator),
                SizedBox(
                  height: 20,
                ),
                CustomFormField(
                    obscureText: true,
                    labelText: "Password",
                    hintText: "Password",
                    icon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: _passwordValidator),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('Remember me'),
                    Spacer(),
                    Text('Forgot Password ?'),
                  ],
                ),
                Center(
                  child: CustomElevatedButton(
                    activateBottomSheet: false,
                    buttonText: "Login",
                    backgroundColor: Color(0xff050522),
                    textColor: Color(0xffFFDE69),
                    paddingWidth: 120,
                    formKey: formKey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text1: "Already have account?",
                  text2: "Register",
                  bottomSheet: CreateAccountBottomSheet(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value == null || value.isEmpty) {
      return "Please enter an email address";
    } else if (!emailValid.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
}
