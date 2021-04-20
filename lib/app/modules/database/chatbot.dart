
class Messages {
  DateTime messageTime;
  String senderMessage;
  bool userMessage; // true is for user; false is for chatbot
  String senderName;

  Messages(
      this.messageTime,
      this.senderMessage,
      this.userMessage,
      this.senderName,
      );

  @override
  String toString() {
    return '{ ${this.userMessage}, ${this.messageTime}, ${this.senderMessage}, '
        '${this.senderName} }';
  }
}