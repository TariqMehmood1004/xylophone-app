import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/home/components/custom_add_widget.dart';
import '../../model/course.dart';
import 'components/course_card.dart';
// import 'components/secondary_course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('music/note$soundNumber.wav');
  }

  //
  // random sounds
  final List<String> _sounds = List.generate(
    5,
    // music/note$soundNumber.wav
    (index) => 'music/note${Random().nextInt(7) + 1}.wav',
  );

  //
  // random colors
  final List<Color> _colors = List.generate(
    5,
    (index) =>
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  );
  Offset offset = Offset.zero;
  //
  //list widget() function
  Widget listView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _sounds.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: _colors[index],
                        borderRadius: BorderRadius.circular(8.0)),
                    child: GestureDetector(
                      onTap: () {
                        // AudioPlayer audioPlayer = AudioPlayer();
                        final audio = AudioCache();
                        audio.play(_sounds[index]);
                      },
                      // onLongPress: () {
                      //   showModalBottomSheet(
                      //       isScrollControlled: false,
                      //       backgroundColor: Colors.amber,
                      //       barrierColor: Colors.black45,
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.vertical(
                      //             top: Radius.circular(12.0)),
                      //       ),
                      //       context: context,
                      //       builder: (context) {
                      //         return Container(
                      //           height: 400,
                      //           decoration: BoxDecoration(
                      //             color: backgroundColorDark,
                      //             borderRadius: BorderRadius.circular(5.0),
                      //           ),
                      //           child: const Text('sheet'),
                      //         );
                      //       });
                      // },
                      child: ListTile(
                        title: Text(
                          'Piano'.toString().toUpperCase(),
                          style: const TextStyle(
                            color: backgroundColorDark,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: InkWell(
                            child: const Icon(
                              Icons.music_note,
                              color: Colors.white,
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: false,
                                  backgroundColor: Colors.amber,
                                  barrierColor: Colors.black45,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12.0)),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('sheet'),
                                              Container(
                                                width: 100,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: backgroundColorDark,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    AudioCache().play(
                                                        'music/note${Random().nextInt(7) + 1}.wav');
                                                    debugPrint('tapped');
                                                  },
                                                  child: const Center(
                                                      child: Text(
                                                    'Set Sound',
                                                    style: TextStyle(
                                                      color:
                                                          backgroundColorLight,
                                                      fontSize: 12,
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  //
  // add custom widgets for floating button
  List<AddWidgetForXylophone> addListWidget = [];
  void addWidget() {
    setState(() {
      addListWidget.add(const AddWidgetForXylophone());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Available Courses",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courses
                      .map(
                        (course) => Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CourseCard(
                            title: course.title,
                            iconSrc: course.iconSrc,
                            color: course.color,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Text(
                  "Melodies",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      piano(
                          letter: "A",
                          color: const Color(0xFF7553F6),
                          soundNumber: 1),
                      piano(
                          letter: "B",
                          color: const Color(0xFF7553F6),
                          soundNumber: 2),
                      piano(
                          letter: "c",
                          color: const Color(0xFF7553F6),
                          soundNumber: 3),
                      piano(
                          letter: "d",
                          color: const Color(0xFF7553F6),
                          soundNumber: 4),
                      piano(
                          letter: "f",
                          color: const Color(0xFF7553F6),
                          soundNumber: 5),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: const SizedBox(
                          child: Text(
                            "Random Melodies",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      listView(),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: addListWidget.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: addListWidget[index],
                          );
                        },
                      ),
                    ],
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
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(6.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: backgroundColorDark,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: FloatingActionButton(
            backgroundColor: backgroundColorDark,
            elevation: 0,
            heroTag: "Add",
            onPressed: () {
              setState(() {
                Future.delayed(const Duration(milliseconds: 800), () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomController()));
                });
              });
            },
            child: const Icon(
              Icons.add,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget piano(
      {String letter = "",
      Color color = const Color(0xFF7553F6),
      int soundNumber = 1}) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        debugPrint('tapped');
        playSound(soundNumber);
        // AudioCache().load('assets/music/note1.wav');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.0),
        decoration: const BoxDecoration(
          color: Color(0xFF7553F6),
          // color: Color(0xFF7553F6),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    letter.toString().toUpperCase(),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
              child: VerticalDivider(
                color: Colors.white70,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.numbers,
              color: backgroundColorLight,
            ),
          ],
        ),
      ),
    );
  }
}

class AddWidgetForXylophone extends StatefulWidget {
  const AddWidgetForXylophone({super.key});

  @override
  State<AddWidgetForXylophone> createState() => _AddWidgetForXylophoneState();
}

class _AddWidgetForXylophoneState extends State<AddWidgetForXylophone> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GestureDetector(
          onTap: () {
            AudioCache().play(
              'music/note${Random().nextInt(7) + 1}.wav',
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text('piano')),
          ),
        ),
      ),
    );
  }
}
