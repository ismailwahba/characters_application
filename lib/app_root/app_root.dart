
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_router.dart';
import '../business_logic/cubit/characters_cubit.dart';
import '../data/repository/characters_repository.dart';

class BreakingBadApp extends StatelessWidget {
  // const BreakingBadApp({super.key});
  final AppRouter appRouter;
    // final CharactersRepository charactersRepository;


   BreakingBadApp({
    Key? key,
    required this.appRouter,
    // required this.charactersRepository,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersCubit(),
          // create: (context) => CharactersCubit(charactersRepository),
        ),
        
      ],
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    )
    );
  }
}