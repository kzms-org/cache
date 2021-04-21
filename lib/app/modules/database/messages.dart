
class Messages {
  DateTime messageTime;
  String message;
  bool userMessage; // true is for user; false is for chatbot
  String senderName;

  Messages({
    this.messageTime,
    this.message,
    this.userMessage,
    this.senderName,
  });

  @override
  String toString() {
    return '{ ${this.userMessage}, ${this.messageTime}, ${this.message}, '
        '${this.senderName} }';
  }
}