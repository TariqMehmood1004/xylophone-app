import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/course.dart';
import 'components/course_card.dart';
// import 'components/secondary_course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Melodies",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: Text(
              //     "Recent",
              //     style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              //         color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // ...recentCourses
              //     .map(
              //       (course) => Padding(
              //         padding: const EdgeInsets.only(
              //           left: 20,
              //           right: 20,
              //           bottom: 20,
              //         ),
              //         child: SecondaryCourseCard(
              //           title: course.title,
              //           iconsSrc: course.iconSrc,
              //           colorl: course.color,
              //         ),
              //       ),
              //     )
              //     .toList(),

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
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  debugPrint('tapped');
                  // AudioCache().load('assets/music/note1.wav');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF7553F6),
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
                              'A',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
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
                          // thickness: 5,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset("assets/icons/ios.svg"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
