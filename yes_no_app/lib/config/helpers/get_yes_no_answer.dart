
import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:yes_no_app/infraestucture/models/yes_no_model.dart";
import "../../domain/entities/message.dart";

class GetYesNoAnswer{

  final _dio = Dio();

  Future<Message> getAnswer() async{

    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    
    return yesNoModel.toMessageEntity();
  }


}

/*
now I use a mapper
return Message(
      text: yesNoModel.answer,
      fromwho: FromWho.HERS,
      imageURL: yesNoModel.image
    );
*/


/*
This way I'll need to be extremely careful with spaces between square brackets
also if something changes in the api answer I'll have to modify each part 
where response.data["XXXXCCCC"] appears, now I have a model class
    return Message(
      text: response.data["answer"],
      fromwho: FromWho.HERS,
      imageURL: response.data["image"]
    );
*/

