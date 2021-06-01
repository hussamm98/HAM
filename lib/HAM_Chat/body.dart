import 'package:flutter/material.dart';
import 'package:flutter_auth/User_Interface/components/listing_doctor_users.dart';
import 'package:flutter_auth/User_Interface/components/navigation_bar.dart';

import '../constants.dart';
import 'chat_card.dart';
import 'filled_outline_button.dart';
import 'messages/message_screen.dart';
import 'models/Chat.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              defaultPadding, 0, defaultPadding, defaultPadding),
          color: primaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: defaultPadding),
              FillOutlineButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AllOfDocs(
                        );
                      },
                    ),
                  );
                },
                text: "Messenger",
              ),
              SizedBox(width: defaultPadding* 1.2),

              FillOutlineButton(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyBottomNavigationBar(
                            );
                          },
                        ),
                      );
                    },
                    text: "Home Page",
                  ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
