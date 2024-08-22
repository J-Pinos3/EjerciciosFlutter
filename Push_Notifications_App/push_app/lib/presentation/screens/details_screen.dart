import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';

import '../blocs/notifications/notifications_bloc.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pushMessageId});

  final String pushMessageId;

  @override
  Widget build(BuildContext context) {

    final PushMessage? message = context.watch<NotificationsBloc>().getMessageById(pushMessageId);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de la notificación"),
      ),
      body:  message != null
      ? _DetailsView(message: message)
      : const Center(child: Text("No existe la notificación")),
    );
  }
}


class _DetailsView extends StatelessWidget {
  const _DetailsView({super.key, required this.message});

  final PushMessage message;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [

          if(message.imageUrl != null)
            Image.network(message.imageUrl!),
              
          const SizedBox(height: 30,),

          Text(message.title, style: textStyles.titleMedium),
          Text(message.body),

          const Divider(),
          Text( message.data.toString() )
        ],
      ),
    );
  }
}