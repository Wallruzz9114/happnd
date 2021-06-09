import 'package:flutter/material.dart';
import 'package:happnd/components/app_scaffold.dart';
import 'package:happnd/pages/alerts_page.dart';
import 'package:happnd/pages/map_page.dart';
import 'package:happnd/pages/profile_page.dart';
import 'package:happnd/components/record_button.dart';
import 'package:happnd/pages/search_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const RootPage());
  }

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  @override
  AppScaffold build(BuildContext context) {
    return AppScaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          MapPage(),
          SearchPage(),
          AlertsPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: Material(
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF40489D), Color(0xFF2D6FA5)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomNavigationButton(
                  label: 'Home',
                  icon: const Icon(Icons.home),
                  tabIndex: 0,
                ),
                _bottomNavigationButton(
                  label: 'Search',
                  icon: const Icon(Icons.search),
                  tabIndex: 1,
                ),
                const RecordButton(),
                _bottomNavigationButton(
                  label: 'Alerts',
                  icon: const Icon(Icons.notifications),
                  tabIndex: 2,
                ),
                _bottomNavigationButton(
                  label: 'Profile',
                  icon: ClipOval(
                    child: Image.network(
                      'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  tabIndex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _bottomNavigationButton({
    required String label,
    required Widget icon,
    required int tabIndex,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = tabIndex;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: icon,
          ),
          const SizedBox(height: 4.5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
