import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2019/08/28/17/17/girl-4437225_640.jpg",),
                    radius: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Mark Sacca", style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 22, fontWeight: FontWeight.w600),),
                    Text("saccamark@gmail.com", style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.surface),)
                  ],)
                ],
              )
        ),
        const SizedBox(height: 16,),
        ListTile(
          leading: Icon(Icons.group, color: Colors.grey ,size: 26),
          title: Text("New Group", style: TextStyle(color: Colors.black87),),
          onTap: () {},
        ),
         ListTile(
          leading: Icon(Icons.broadcast_on_home, color: Colors.grey ,size: 26),
          title: Text("New Broadcast", style: TextStyle(color: Colors.black87),),
          onTap: () {},
        ),
         ListTile(
          leading: Icon(Icons.link, color: Colors.grey ,size: 26),
          title: Text("Linked Device", style: TextStyle(color: Colors.black87),),
          onTap: () {},
        ),
         ListTile(
          leading: Icon(Icons.star_rounded, color: Colors.grey ,size: 26),
          title: Text("Starred Messages", style: TextStyle(color: Colors.black87),),
          onTap: () {},
        ),
         ListTile(
          leading: Icon(Icons.settings, color: Colors.grey ,size: 26),
          title: Text("Settings", style: TextStyle(color: Colors.black87),),
          onTap: () {},
        )
      ],),
    );
  }
}