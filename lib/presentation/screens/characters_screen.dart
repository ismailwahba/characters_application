// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:characters_app/constants/my_colors.dart';
import 'package:characters_app/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../widgets/characters_item.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/widgets.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Results> allCharacters;
  late final List<Results> character;
  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return showLodingIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
          color: MyColors.myGrey,
          child: Column(
            children: [
              buildCharactersList(),
            ],
          )),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters.length,
        itemBuilder: (ctx, index) {
          return Container(
            decoration: BoxDecoration(
              color: MyColors.myWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: GridTile(
              child: Container(
                  color: MyColors.myGrey,
                  child: allCharacters[index].image!.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: 'assests/images/loading.gif',
                          image: allCharacters[index].image!,
                        )
                      : Image.asset("assets/iages/placeholder.jpg"),),
            ),
          );
        });
  }

  Widget showLodingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          title: Text(
            "Characters",
            style: TextStyle(color: MyColors.myGrey),
          ),
        ),
        body: buildBlocWidget(),
      ),
    );
  }
}
