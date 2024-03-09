import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

    final ScrollController chatScrollController = ScrollController();
    final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

    List<Message> messages = [
    Message(text: "Hola Eddie", fromwho: FromWho.ME),
    Message(text: "Van a tocar con Maiden en 2024?", fromwho: FromWho.ME),
    Message(text: "Genial, será un conciertazo", fromwho: FromWho.ME),
    ];

    Future<void> sendMessage(String text) async {

        if(text.isEmpty){
            return ;
        }

        var newMessage = Message(text: text, fromwho: FromWho.ME);
        messages.add(newMessage);


        if(text.trim().endsWith("?")){
            herReply();
        }

        notifyListeners();
        moveScrollToBottom();
    }

    Future<void> herReply() async{
      final herMessage = await getYesNoAnswer.getAnswer();
      messages.add(herMessage);

      notifyListeners();
      moveScrollToBottom();
    }

    Future<void> moveScrollToBottom() async{
        //le hacemos async para que se demore un poco,
        //carge el mensaje y luego haga el scroll
        await Future.delayed(const Duration(milliseconds: 100));
        chatScrollController.animateTo(chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut
        );
    }
}
