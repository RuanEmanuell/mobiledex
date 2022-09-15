import "package:mobx/mobx.dart";

part "appdata.g.dart";

class PokemonData=_PokemonData with _$PokemonData;

abstract class _PokemonData with Store{
  @observable
  Map<String,dynamic> data = {};
  @observable
  bool favorite=false;
  @observable
  var favorites=[];
}