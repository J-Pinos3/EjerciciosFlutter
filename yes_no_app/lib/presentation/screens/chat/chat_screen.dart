import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/d2/3f/04/d23f0468-dfa6-45aa-afb1-a3238d5e4f58/825646129232.jpg/256x256bb.jpg"),
          ),
        ),
        title: const Text("Eddie"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();//busca una instancia de chat provider

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return (message.fromwho == FromWho.HERS) ? HerMessageBubble(message: message) : MyMessageBubble(message: message);
                },
            )),
        
            //caja de texto
            //MessageFieldBox(onValue: (value)=>chatProvider.sendMessage(value),), LO DE ABAJO ES RESUMIDO
            MessageFieldBox(
              onValue:chatProvider.sendMessage,
              ),
          ],
        ),
      ),
    );
  }
}