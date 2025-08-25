
class RowGrille{
  int id;
  double from;
  double to;
  double fraisAchat;
  double fraisAuctionNow;
  double fraisSortie;
 
 RowGrille({
    this.id = 0,
    this.from = 0.0,
    this.to = 0.0,
    this.fraisAchat = 0.0,
    this.fraisAuctionNow=0.0,
    this.fraisSortie=0.0,
  });
  factory RowGrille.fromJson(Map<String,dynamic> grilleJson){
    return new RowGrille(
      id: grilleJson['id'] as int,
      from: grilleJson['from'] as double,
      to: grilleJson['to'] as double,
      fraisAchat: grilleJson['fraisAchat'] as double,
      fraisAuctionNow: grilleJson['fraisAuctionNow'] as double,
      fraisSortie: grilleJson['fraisSortie'] as double
    );
  }

}
class RowGrilleList{
  final List<RowGrille> rows;
  RowGrilleList({
    this.rows=const [],
  });
factory RowGrilleList.fromJson(List<dynamic> parsedJson) {

    List<RowGrille> grille =[];
    grille= parsedJson.map((i)=>RowGrille.fromJson(i)).toList();
    return new RowGrilleList(
       rows:grille,
    );
  }
}
