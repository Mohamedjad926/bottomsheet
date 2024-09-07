import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_task/widgets/bottom_sheets/login_bottom_Sheet.dart';
import 'package:iti_task/widgets/custom_form_field.dart';
import 'package:iti_task/widgets/custom_text.dart';

import '../custom_elevated_button.dart';

class CreateAccountBottomSheet extends StatelessWidget {
  CreateAccountBottomSheet({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var courseController = TextEditingController();
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
                          'Hello..',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff050522)),
                        ),
                        Text(
                          'Register',
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
                  height: 10,
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
                    labelText: "Course",
                    hintText: "course",
                    icon: Icons.visibility,
                    textInputType: TextInputType.emailAddress,
                    controller: courseController,
                    validator: _courseValidator),
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
                CustomFormField(
                    obscureText: true,
                    labelText: "Confirm Password",
                    hintText: "Confirm Password",
                    icon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    controller: confirmPasswordController,
                    validator: _confirmPasswordValidator),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomElevatedButton(
                    activateBottomSheet: false,
                    buttonText: "Register",
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
                  text2: "Login",
                  bottomSheet: LoginBottomSheet(),
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

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.isNotEmpty && value != passwordController.text) {
      return "Passwords do not match";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
}

String? _courseValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter course field";
  }
  return null;
}
