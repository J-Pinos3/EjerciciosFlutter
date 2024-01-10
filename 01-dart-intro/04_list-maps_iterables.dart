void main() {

  final numbers = <int>[1,2,3,4,5,5,5,6,7,8,9,9,10];
  
  print("Lista original ${numbers}");
  
  print("\nNúmero de elementos ${numbers.length}");
  
  print("\nPrimer elemento indice 0:  ${numbers[0]}");
  
  print("\nPrimer elemento indice 0:  ${numbers.first}");
  
  print("\nLista al revez:  ${numbers.reversed}"); //devuelve un iterable
  
  
  var reversedNumbers = numbers.reversed;//Iterable<int>
  print('\n\n\nIterable: ${reversedNumbers}');
  print('\nLista: ${reversedNumbers.toList()}');
  print('\nSet: ${reversedNumbers.toSet()}');//Sin repetidos
  
  
  final numbersGreaterEqualsThan5 = numbers.where( (int num){
    return num >= 5;
  } ).toSet().toList();
  //to set para eliminar repetidos
  
  print("\n\n\n #'s >= 5: $numbersGreaterEqualsThan5");
  
  
  final numbersGreaterThan5 = numbers.where( (int num){
    return num > 5;
  } );
  //sin to list para obtener el iterable
  
  print("\n #'s > 5: $numbersGreaterThan5");
  
  
}//MÉTODO DE MAIN
