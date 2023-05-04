// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:characters_app/data/models/characters.dart';
import 'package:characters_app/data/web_services/characters_web_services.dart';
import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';

import 'package:characters_app/data/repository/characters_repository.dart';

// import '../../data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  // final CharactersRepository charactersRepository;
  Character? character;
  CharactersCubit(): super(CharactersInitial());
  List<Results> getAllCharacters() {
    CharactersRepository(CharactersWebServices())
        .getAllCharacters()
        .then((response) {
      emit(CharactersLoaded(response.results!));
      character = response;
    });
    return character!.results!;
  }
}
