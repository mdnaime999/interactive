import 'package:flutter/material.dart';

class ProfileFriendsCount extends StatelessWidget {
  const ProfileFriendsCount({
    super.key,
    this.tittle,
    this.style,
  });
  final String? tittle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("data"),
      ],
    );
  }
}
