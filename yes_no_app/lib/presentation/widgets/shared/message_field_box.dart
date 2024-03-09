import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  
  final ValueChanged<String> onValue;
  const MessageFieldBox({
      super.key,
      required this.onValue
    });
  

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlinInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with "?" ',
        enabledBorder: outlinInputBorder,
        focusedBorder: outlinInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined), 
          onPressed: (){//cuando el usuario presiona el botón de enviar
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
        ), 
      );
    
    
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller:  textController,
      decoration: inputDecoration	,
      onFieldSubmitted: (value) {
        //cuando el usuario pulsa ENTER
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }

}