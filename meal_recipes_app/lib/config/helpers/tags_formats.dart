
class TagsFormats{

  static String infoTag(String tags){
    
    if(tags.contains(",")){
      final tagsList = tags.split(",");
      return tagsList[0];
    }
    return tags;
  }

}