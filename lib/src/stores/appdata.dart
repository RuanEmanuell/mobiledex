import 'package:mobx/mobx.dart';

part "appdata.g.dart";

class PokemonData =_PokemonData with _$PokemonData;

abstract class _PokemonData with Store{
  @observable
  var data;
}