void main(){
  
  //con async*, la función devuelve un stream
  emitNumbers()
    .listen( (int value){
      print("Stream value: $value");
    } );
}


Stream <int>emitNumbers() async*{
  final valuesToEmit = <int>[1,2,3,4,5];
  
  for(int i in valuesToEmit){
    await Future.delayed( const Duration(seconds: 2) );  
    yield i;
  }
  
  
}

