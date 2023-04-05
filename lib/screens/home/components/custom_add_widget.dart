import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/home/home_screen.dart';

import '../../../constants.dart';

class CustomController extends StatefulWidget {
  const CustomController({super.key});

  @override
  State<CustomController> createState() => _CustomControllerState();
}

class _CustomControllerState extends State<CustomController> {
  final List<MyWidget> list = [];

  void _addDice() {
    setState(() {
      list.add(const MyWidget());
    });
  }

  void _deleteDice() {
    setState(() {
      if (list.isEmpty) {
        debugPrint("empty");
      } else {
        list.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16.0),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 200,
                        height: 80,
                        color: Colors.transparent,
                        child:
                            list.isNotEmpty ? list[index] : const Text("empty"),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(6.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: backgroundColorDark,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: backgroundColorDark,
                elevation: 0,
                heroTag: "Back",
                onPressed: () {
                  setState(() {
                    Future.delayed(const Duration(milliseconds: 800), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    });
                  });
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                ),
              ),
              FloatingActionButton(
                backgroundColor: backgroundColorDark,
                elevation: 0,
                heroTag: "Delete",
                onPressed: () {
                  _deleteDice();
                },
                child: const Icon(
                  Icons.delete,
                  size: 18,
                ),
              ),
              FloatingActionButton(
                backgroundColor: backgroundColorDark,
                elevation: 0,
                onPressed: () {
                  setState(() {
                    _addDice();
                  });
                },
                heroTag: "AddCustom",
                child: const Icon(
                  Icons.add,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      // setState(() {
      //   Future.delayed(const Duration(milliseconds: 800), () {
      //     Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => const HomePage()));
      //   });
      // });
      //       },
      //       heroTag: "Back",
      //       tooltip: 'Delete Dice',
      //       child: const Icon(Icons.arrow_back_ios_new),
      //     ),
      //     const SizedBox(
      //       width: 5,
      //     ),
      //     FloatingActionButton(
      //       onPressed: _deleteDice,
      //       heroTag: "Delete",
      //       tooltip: 'Delete Dice',
      //       child: const Icon(Icons.delete),
      //     ),
      //     const SizedBox(
      //       width: 5,
      //     ),
      //     FloatingActionButton(
      //       backgroundColor: Colors.black,
      //       heroTag: "Add",
      //       onPressed: _addDice,
      //       tooltip: 'Add Dice',
      //       child: const Icon(
      //         Icons.add,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('music/note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: piano(),
    );
  }

  Widget piano() {
    return Container(
      decoration: BoxDecoration(
        color:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        // color: Color(0xFF7553F6),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          debugPrint('tapped');
          AudioCache().play('music/note${Random().nextInt(7) + 1}.wav');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Custom piano'.toString().toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: const Icon(
                Icons.music_note_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
