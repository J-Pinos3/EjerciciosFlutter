//sync* tells dart that this is generatir f unction
//yield adds i to the iterable
Iterable<int> countTo(int max) sync*{
  int i=0;
  while(i < max){
    yield i++;
  }
}



void main(){
  Iterable iterable = countTo(5);
  Iterator it = iterable.iterator;

  while(it.moveNext()){
    print(it.current);
  }
}