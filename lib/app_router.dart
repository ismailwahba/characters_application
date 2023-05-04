// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors

import 'package:characters_app/data/repository/characters_repository.dart';
import 'package:characters_app/data/web_services/characters_web_services.dart';
import 'package:characters_app/presentation/screens/characters_screen.dart';
import 'package:characters_app/presentation/screens/charactersdetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/characters_cubit.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit();
    // charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharactersCubit(),
                  // create: (context) => CharactersCubit(charactersRepository),
                  child: CharactersScreen(),
                ));
      case charactersDetails:
        return MaterialPageRoute(builder: (_) => CharactersDetails());
    }
  }
}
