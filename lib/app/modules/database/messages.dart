
class Messages {
  DateTime messageTime;
  String message;
  bool userMessage; // true is for user; false is for chatbot
  String senderName;
  bool isText;

  Messages({
    this.messageTime,
    this.message,
    this.userMessage,
    this.senderName,
    this.isText,
  });

  @override
  String toString() {
    return '{ ${this.userMessage}, ${this.messageTime}, ${this.message}, '
        '${this.senderName} }';
  }
}