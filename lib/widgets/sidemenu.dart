
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Todo App'),
          ),
          ListTile(
            title: const Text('Home'),
            selected: true,
            leading: const Icon(Icons.home),
            onTap: () {

               context.push(RouteLocation.home);
            },
          ),
          ListTile(
            title: const Text('Today Tasks'),
            selected: true,
            leading: const Icon(Icons.today),
            hoverColor: Colors.red,
    
            onTap: () {
             context.push(RouteLocation.todayTasks);
            },
          ),
          ListTile(
            title: const Text('Upcoming Tasks'),
            selected: true,
            leading: const Icon(Icons.calendar_today),
            onTap: () {
              context.push(RouteLocation.upcomingTasks);
            },
          ),
          ListTile(
            title: const Text('Search Tasks'),
            selected: true,
            leading: const Icon(Icons.search),
            onTap: () {
              context.push(RouteLocation.searchTasks);
            },
          ),
        ],
      ),

    );
  }
}