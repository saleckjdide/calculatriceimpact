
import 'dart:convert';

class Ville{
  int id;
  String name;
  double fraisMTRL=0;
  String province="";
  double tps=0;
  double tvq=0;

 
  Ville({
    this.id = 0,
    this.name = '',
    this.fraisMTRL = 0.0,
    this.province = '',
    this.tps = 0.0,
    this.tvq = 0.0,
  });
  factory Ville.fromJson(Map<String,dynamic> villeJson){
    return new Ville(
      id: villeJson['id'] as int,
      name: villeJson['name'],
      fraisMTRL: villeJson['fraisMTRL'] as double, 
      province: villeJson['province'],
      tps: villeJson['TPS'] as double,
      tvq: villeJson['TVQ'] as double,
    );
  }

}
List<Ville> allVillesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Ville>.from(jsonData.map((x) => Ville.fromJson(x)));
}
class VillesList{
  final List<Ville> villes;
  VillesList({
    required this.villes,
  });
  
factory VillesList.fromJson(List<dynamic> parsedJson) {

   List<Ville> listeVilles = [];


    listeVilles= parsedJson.map((i)=>Ville.fromJson(i)).toList();
    return new VillesList(
       villes:listeVilles,
    );
  }
}

