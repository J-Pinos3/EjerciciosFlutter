void main(){
  
  print("Inicio de main");
  
  httpGet("https://www.youtube.com/watch?v=VFxp4uu73t0")
    .then(
      (value){
        print(value);
      }
    )
    .catchError(
      (err){
        print("Error atrapado: $err");
      }
    );
  
  print("Fin de main");
}

//future es el resultado de una operación asíncrona
//future es la promesa de que luego tendré un valor
Future<String> httpGet(String url){
  
  return Future.delayed( const Duration(seconds: 2), (){
    throw "Error en la petición http";
    //    return "Respuesta de la petición http";
  });
  
}