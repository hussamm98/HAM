import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/pages/docModel.dart';

import '../pages/doctors_cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyDoctors extends StatelessWidget {
  Future<DocModel> getUser() async {
    final String apiUrl =
        "http://hussam69-001-site1.dtempurl.com/api/ApiHAMController/GetDoctors";
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(' RESPONSE STATUS =: ${response.statusCode}');
      print('RESPONSE body = ${response.body}');
      return DocModel.fromJson(response.body);
    } else {
      print('Error!');
      print(' RESPONSE STATUS =: ${response.statusCode}');
      print('RESPONSE body = ${response.body}');

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocModel>(
        future: getUser(),
        builder: (context, snapshot) {
          print(snapshot.data.listOfDoctro);
          final doctorsList = snapshot.data.listOfDoctro;
          if (snapshot.data.listOfDoctro == null) {
            return Container(
              child: Center(
                child: Text('Loading .....'),
              ),
            );
          } else {
            return Container(
              child: ListView.builder(
                itemCount: doctorsList.length,
                itemBuilder: (context, int index) {
                  return DocMenuItemCard(doctor: doctorsList[index]);
                },
              ),
            );
          }
        });
  }
}
