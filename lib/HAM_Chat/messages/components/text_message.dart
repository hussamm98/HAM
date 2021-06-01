import 'package:flutter/material.dart';
import 'package:flutter_auth/HAM_Chat/models/ChatMessage.dart';
import '../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key key,
    this.message,
  }) : super(key: key);
  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding * 0.75,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: message.isSender
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1.color,
        ),
      ),
    );
  }
}
