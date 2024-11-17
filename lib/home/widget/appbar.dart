import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MainAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(title,
          style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 18, fontWeight: FontWeight.w600),),
          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}