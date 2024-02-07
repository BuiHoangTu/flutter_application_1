import 'package:apartment_building_manager_replica/utils/icon_image_provider.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const MyAppBar({super.key, required String title}) : _title = title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              _title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _LoggedInUser(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LoggedInUser extends StatelessWidget {
  final NetworkImage _userAvatar = const NetworkImage(
      'https://scontent.fhan4-2.fna.fbcdn.net/v/t39.30808-6/340276739_6170112366387343_2510419967984658211_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=783fdb&_nc_eui2=AeFpZRBVs3BDblRqxmon5inVgLuyqpNVZnSAu7Kqk1VmdOQrU5cdvQzSBqk5oJ6GPdfg2_blSDeGu9mqOLVLLmIt&_nc_ohc=ruY5toI-ObUAX9_khvM&_nc_ht=scontent.fhan4-2.fna&oh=00_AfDOXEZV-JbAvIAMepR3KWNqD9W30F99yOBcMa_ufEmy0Q&oe=65C8AD29');
  final String _userName = "Username";
  final String _userId = "123Username";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _userName,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'User ID: $_userId',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        SizedBox(width: 10),
        CircleAvatar(
          backgroundImage: IconImageProvider(Icons.person),
          foregroundImage: _userAvatar,
        )
      ],
    );
  }
}
