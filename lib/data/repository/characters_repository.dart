// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:characters_app/data/web_services/characters_web_services.dart';

import '../models/characters.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);
  Future<Character> getAllCharacters() async {
    final character = await charactersWebServices.getAllCharacters();
    return Character.fromJson(character);
  }
}
