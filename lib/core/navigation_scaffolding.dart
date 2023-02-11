import 'package:go_router/go_router.dart';
import 'package:playground/core/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationScaffolding extends StatelessWidget {
  const NavigationScaffolding({required this.page, super.key});

  final Widget page;

  _signOut(BuildContext context) async {
    GoRouter.of(context).go("/signIn");

    await context.read<AuthenticationService>().signOut();
  }

  void _onBottomNavItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/games');
        break;
      case 2:
        GoRouter.of(context).go('/friends');
        break;
    }
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/games')) {
      return 1;
    }
    if (location.startsWith('/friends')) {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(child: page),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        selectedItemColor: Colors.amber[800],
        onTap: (idx) => _onBottomNavItemTapped(idx, context),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () => _signOut(context),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
