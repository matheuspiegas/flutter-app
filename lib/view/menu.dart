import 'package:flutter/material.dart';
import 'package:flutterteste/view/feriados.dart';
import 'package:flutterteste/view/home_page.dart';
import 'package:flutterteste/view/login_page.dart';

class MenuDrawer extends StatefulWidget {
  final int? selectedMenuItem;
  const MenuDrawer({
    super.key,
    this.selectedMenuItem,
  });

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            color: widget.selectedMenuItem == 0 ? Colors.grey[300] : null,
            child: ListTile(
              title: const Text('Cursos'),
              leading: const Icon(Icons.book),
              onTap: () {
                if (widget.selectedMenuItem != 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Container(
            color: widget.selectedMenuItem == 1 ? Colors.grey[300] : null,
            child: ListTile(
              title: const Text('Feriados'),
              leading: const Icon(Icons.calendar_today),
              onTap: () {
                if (widget.selectedMenuItem != 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Feriados()));
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('Sair'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
