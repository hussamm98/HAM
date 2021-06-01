import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'email is required'),
  EmailValidator(errorText: 'Invalid Email Form')
]);

class RoundedInputField extends StatelessWidget {
  final TextEditingController emailController;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        //modified textfield
        validator: emailValidator,
        controller: emailController,
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
