import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../generated/l10n.dart';
import 'page/activities_page.dart';
import 'page/feed_page.dart';
import 'page/post_page.dart';
import 'page/profile_page.dart';
import 'page/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const FeedPage(),
    const SearchPage(),
    const PostPage(),
    const ActivitiesPage(),
    const ProfilePage(),
  ];

  int _currentIndex = 0;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.house),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            label: S.of(context).search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.squarePlus),
            label: S.of(context).add,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.heart),
            label: S.of(context).activities,
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.user),
            label: S.of(context).user,
          ),
        ],
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
