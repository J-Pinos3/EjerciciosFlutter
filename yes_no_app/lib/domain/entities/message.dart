enum FromWho{ME, HERS}

class Message{

  final String text;
  final String? imageURL;
  final FromWho fromwho;

  Message({
    required this.text,
    this.imageURL,
    required this.fromwho
    });

  String getMessageText() => text;
  String? getMessageImage() => this.imageURL;
  FromWho getMessageOwner() => fromwho;

}