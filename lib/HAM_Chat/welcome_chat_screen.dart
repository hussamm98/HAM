import '../constants.dart';
import 'chats_screen.dart';
import 'package:flutter/material.dart';

class WelcomeChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 3),
            Image.asset("assets/images/welcome_image.png"),
            Spacer(flex: 2),
            Text(
              "Welcome to HAM \n Messenger",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "It Connects you with our Doctors \n and their Assistants.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.64),
              ),
            ),
            Spacer(flex: 2),
            FittedBox(
              child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatsScreen(),
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        "Go To Chats",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(1),
                            ),
                      ),
                      SizedBox(width: defaultPadding / 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.8),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
