import 'package:flutter/material.dart';
import 'package:happnd/components/map_tab.dart';
import 'package:happnd/components/profile_tab.dart';
import 'package:happnd/pages/record_page.dart';

enum _Tab {
  map,
  profile,
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TabPage());
  }

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  _Tab _currentTab = _Tab.map;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTab.index,
        children: const <Widget>[
          MapTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavigationButton(_Tab.map),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(RecordPage.route());
            },
            icon: const Icon(Icons.video_call),
          ),
          _bottomNavigationButton(_Tab.profile),
        ],
      ),
    );
  }

  IconButton _bottomNavigationButton(_Tab tab) {
    late IconData iconData;
    if (tab == _Tab.map) {
      iconData = Icons.home;
    } else if (tab == _Tab.profile) {
      iconData = Icons.person;
    }
    return IconButton(
      icon: Icon(iconData),
      onPressed: () {
        setState(() {
          _currentTab = tab;
        });
      },
    );
  }
}
