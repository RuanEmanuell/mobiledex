// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdata.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonData on _PokemonData, Store {
  late final _$dataAtom = Atom(name: '_PokemonData.data', context: context);

  @override
  dynamic get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(dynamic value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
