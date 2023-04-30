import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CharactersDetails extends StatefulWidget {
  const CharactersDetails({super.key});

  @override
  State<CharactersDetails> createState() => _CharactersDetailsState();
}

class _CharactersDetailsState extends State<CharactersDetails> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("CharactersDetails"),
      ),
    ));
  }
}
