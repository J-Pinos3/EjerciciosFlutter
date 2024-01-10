void main() {

  print(greetEveryone());
  
  print("\n\n" + sayHolaMundo() ); 
  
  print("\n\nSuma de 8 + 7 = ${addTwoNumbers(8,7)}"  );
  
  double a = 11.20;
  double b = 7.1;
  print("\n\nSuma de $a + $b = ${sumTwoDoubles(a,b)}"  );
  
}//MÉTODO DE MAIN



String greetEveryone(){
  return "Hello everyone!!!";
}


//SOLO FLECHA (=>) VALOR DE RETORNO
String sayHolaMundo() => "Hola Mundo";


int addTwoNumbers(int a, int b){
  return a + b;
}


double sumTwoDoubles(double a , double b) => a + b;


int addTwoNumbersOptional(int a, [int? b]){
  
  b ??= 4;
  //b = b ?? 4
  
  return a + b;
}


int addTwoNumbersOptionalVersion2(int a, [int b = 0]){
  return a + b;
}




