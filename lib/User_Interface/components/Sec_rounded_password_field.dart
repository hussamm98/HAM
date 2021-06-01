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

class RoundedPasswordField2 extends StatefulWidget {
  TextEditingController passController = new TextEditingController();
  String hint;

  RoundedPasswordField2(String s, [TextEditingController t]) {
    this.hint = s;
    this.passController = t;
  }

  @override
  _RoundedPasswordField2State createState() => _RoundedPasswordField2State();
}

class _RoundedPasswordField2State extends State<RoundedPasswordField2> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        //modified textfield
        onChanged: (val) => password1 = val,
        validator: //passwordValidator//MinLengthValidator(6, errorText: "Should be atleast 6 Characters")
            (value) //modified
            {
          if (value.isEmpty) {
            return "password is required";
          } else if (value.length < 6) {
            return "Should be atleast 6 Characters";
          } else
            null;
        },
        controller: widget.passController,
        obscureText: false,
        keyboardType: TextInputType.text,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              password ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF6F35A5),
            ),
            // 3shan t3'yeer l icons
            onPressed: () {
              setState(() {
                password = !password; // 3shan t5tfy w trg3 tany
              });
            },
          ),
        ),
      ),
    );
  }
}
