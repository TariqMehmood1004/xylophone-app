import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.bio,
  }) : super(key: key);

  final String name, bio;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          color: Colors.white,
          CupertinoIcons.person,
        ),
      ),
      title: Text(
        name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        bio,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
