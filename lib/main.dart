// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:characters_app/app_router.dart';
import 'package:characters_app/business_logic/cubit/characters_cubit.dart';

import 'app_root/app_root.dart';
import 'data/repository/characters_repository.dart';

// late final CharactersRepository charactersRepository;
void main() {
  //  CharactersRepository charactersRepository;
  

  runApp(BreakingBadApp(
    appRouter: AppRouter(),
    // charactersRepository: charactersRepository,
  ));
}
