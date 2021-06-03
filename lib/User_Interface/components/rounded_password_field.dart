import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
]);
String password1;

class RoundedPasswordField extends StatefulWidget {
  TextEditingController passController = new TextEditingController();
  String hint;

  RoundedPasswordField(String s, [TextEditingController t]) {
    this.hint = s;
    this.passController = t;
  }

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}
class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: password,
        keyboardType: TextInputType.text,
        //modified textfield
        onChanged: (val) => password1 = val,
        validator: //passwordValidator//MinLengthValidator(6, errorText: "Should be atleast 6 Characters")
            (value) //modified
            {
          if (value.isEmpty) {
            return "password is required";
          } else if (value.length < 6) {
            return "Should be atleast 6 Characters";
          }
          if (value != password1) {
            return "Password must be same as above";
          } else
            null;
        },
        controller: widget.passController,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          icon: Icon(
            Icons.lock,
            color: Color(0xFF4a1c40),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              password ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF4a1c40),
            ),
            onPressed: () {
              setState(() {
                password = !password;
              });
            },
          ),
        ),
      ),

    );
  }
}
