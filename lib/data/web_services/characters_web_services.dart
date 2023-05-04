// ignore_for_file: unused_local_variable, avoid_print, unused_element, duplicate_ignore

import 'package:characters_app/constants/strings.dart';
import 'package:dio/dio.dart';

// import '../models/characters.dart';

class CharactersWebServices {
   Dio? dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);

    getAllCharacters();
  }

   Future getAllCharacters() async {
    try {
      Response response = await dio!.get('character');
      // ignore: avoid_print
      // print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
