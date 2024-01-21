void main(){
  
  //si no hay un listener, no se ve el stream
  emitNumbers().listen( (value){
    print("Stream value: $value");
  } );
}


Stream<int>emitNumbers (){
  
  return Stream.periodic(const Duration(milliseconds: 500), (value){
    //print("desde periodic $value");    
   return value; 
  }).take(8) ;
  //con take solo da valores de 0 - 7
}