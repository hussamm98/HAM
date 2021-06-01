enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }
class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;
  ChatMessage({
    this.text = '',
     this.messageType,
     this.messageStatus,
     this.isSender,
  });
}
List demeChatMessages = [
  ChatMessage(
    text: "Hi Dr Hatem",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Hello, How can i help you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "this picture will help you",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "I did understand it now!!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Glad you did it.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Thanx Doctor Hatem!!",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Good ..",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: false,
  ),
  ChatMessage(
    text: "Good Luck",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: false,
  ),
];
