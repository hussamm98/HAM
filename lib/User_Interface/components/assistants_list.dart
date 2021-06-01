import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/pages/AssModel.dart';

import '../pages/assistant_cards.dart';

import 'package:http/http.dart' as http;

class MyAssistants extends StatelessWidget {
  Future<AssModel> getUser() async {
    final String apiUrl =
        "http://hussam69-001-site1.dtempurl.com/api/ApiHAMController/GetAssistants";
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(' RESPONSE STATUS =: ${response.statusCode}');
      print('RESPONSE body = ${response.body}');
      return AssModel.fromJson(response.body);
    } else {
      print('Error!');
      print(' RESPONSE STATUS =: ${response.statusCode}');
      print('RESPONSE body = ${response.body}');

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AssModel>(
        future: getUser(),
        builder: (context, snapshot) {
          final assistantList = snapshot.data.listOfAssistant;
          return Container(
            child: ListView.builder(
              itemCount: assistantList.length,
              itemBuilder: (context, int index) {
                return AsMenuItemCard(assistant: assistantList[index]);
              },
            ),
          );
        });
  }
}
