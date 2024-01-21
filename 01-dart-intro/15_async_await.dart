void main() async{
  
  print("Inicio de main");
  
  try{
      final value = await httpGet("https://www.youtube.com/watch?v=VFxp4uu73t0");
      print(value);
  }catch(err){
    print(err);
  }

 

  
  print("Fin de main");
}

//future es el resultado de una operación asíncrona
//future es la promesa de que luego tendré un valor
//async obliga a la función a deolver un future
//await solo se usa con funciones asíncronas
Future<String> httpGet(String url) async {
  
  await Future.delayed( const Duration(seconds: 2));
  
  throw "Error en la petición";
  //return "Valor http";
}