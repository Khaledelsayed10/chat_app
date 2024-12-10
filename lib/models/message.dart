class Message {
  final String message;
  final dynamic id;

  Message(this.message, this.id);
  factory Message.fromjeson(jesonData) {
    return Message(jesonData['message'], jesonData['id']);
  }
}
