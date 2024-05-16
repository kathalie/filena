import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/library_management/presentation/pages/library_management_page.dart';
import '../../../features/synchronization/presentation/pages/synchronization_page.dart';
import '../../../features/user/presentation/pages/user_settings_page.dart';
import '../../../features/version_control/presentation/pages/version_control_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const tabs = [
    (title: 'Категорії', page: LibraryManagementPage()),
    (title: 'Синхроназація', page: SynchronizationPage()),
    (title: 'Контроль версій', page: VersionControlPage()),
    (title: 'Налаштування', page: UserSettingsPage()),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(tabs[_selectedIndex].title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      body: Center(
        child: tabs[_selectedIndex].page,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Center(
                child: Text(
                  'Multiversa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            for (final tab in tabs.indexed)
              ListTile(
                title: Text(tab.$2.title),
                selected: _selectedIndex == tab.$1,
                onTap: () {
                  _onItemTapped(tab.$1);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}
