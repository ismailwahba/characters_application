// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:characters_app/data/models/characters.dart';
import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';

import 'package:characters_app/data/repository/characters_repository.dart';

// import '../../data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<Results> characters;
  CharactersCubit(
    this.charactersRepository,
  ) : super(CharactersInitial());
  List<Results> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters.cast<Results>()));
      this.characters = characters;
    });
    return characters;
  }
}
