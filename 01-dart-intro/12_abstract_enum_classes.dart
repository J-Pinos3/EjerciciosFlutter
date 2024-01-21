void main(){

  final windPlant = new WindPlant( initialEnergy: 100 );
  final nuclearPlant = new NuclearPlant(energyLeft: 1000 );
  
  
  print(windPlant);
  print(windPlant.currentEnergy);
  
  windPlant.consumeEnergy(26);
  print(windPlant.currentEnergy);
  print(windPlant.energyLeft);
  
  print("\n\nWind Comsuption for cellphone: "
  +"${chargePhone(windPlant)}");
  
  print("\n\n\n\nNuclear Comsuption for cellphone: "
  +"${chargePhone(nuclearPlant)}");
}


double chargePhone(EnergyPlant plant){
  if( plant.currentEnergy < 10){
    throw "Not enougth energy to charge cellphone device";
  }
  
  return plant.energyLeft - 10;
}


enum PlantType { nuclear, wind, water, carbon, gas, thermoelectric }
  
abstract class EnergyPlant{
  
  double energyLeft;
  final PlantType type;//nuclear, wind, water
  
  EnergyPlant({
    required this.energyLeft,
    required this.type
  });
  
  void consumeEnergy(double amount);
  
  double get currentEnergy;
  
}



class WindPlant extends EnergyPlant{
  
  WindPlant({ required double initialEnergy })
    :super(energyLeft: initialEnergy, type: PlantType.wind) ;
    
  
  @override
  void consumeEnergy(double amount){
    energyLeft -= amount;
  }
  
  @override
  double get currentEnergy => energyLeft;
}



class NuclearPlant implements EnergyPlant{
  
  @override
  double energyLeft;
  
  @override
  final PlantType type = PlantType.nuclear;
  
  NuclearPlant({ required this.energyLeft });
  
  @override
  void consumeEnergy(double amount){
    energyLeft -= (amount*0.5);
  }
  
  @override
  double get currentEnergy => energyLeft;
}



