import 'package:flutter/material.dart';

class ProfileInfoBackground extends StatelessWidget {
  const ProfileInfoBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade600,
            Colors.purple.shade600,
          ],
        ),
        color: Colors.white54,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
