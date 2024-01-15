void main(){
  final mySquare1 = Square(side: 11);
  
  
  print( "Area de un cuadrado de lado l=${mySquare1.side}: ${mySquare1.calculateArea()}u^2" );
  
  mySquare1.side = 3;
  print( "\nArea de un cuadrado de lado l=${mySquare1.side}: ${mySquare1.calculateArea()}u^2" );
  
  mySquare1.side = -9;
  print( "\nArea de un cuadrado de lado l=${mySquare1.side}: ${mySquare1.calculateArea()}u^2" );
}

class Square{
  //   '_' significa que es privado
  double _side; //area = side *side 
  
  Square({ required double side })
    : assert(side >= 0, 'side paremeter must be >= 0'),
      _side = side;
  
  
  double get area{
    return _side * _side; 
  }
  
  set side(double value){
    print("Setting new value $value");
    
    if(value < 0){
      throw 'Value must be >= 0';
    }
    
    _side = value;
  }
  
  double get side => this._side;
  
  double calculateArea() => _side * _side;
  
  
}