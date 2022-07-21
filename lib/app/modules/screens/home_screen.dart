import 'package:flutter/material.dart';
import 'package:zoom/app/auth/auth_methods.dart';
import 'package:zoom/app/constants/colors.dart';
import 'package:zoom/app/modules/screens/history_meeting_screen.dart';
import 'package:zoom/app/modules/screens/meeting_screen.dart';
import 'package:zoom/app/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 1;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<String> title = ['Home', 'Meetings', 'Settings'];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      MeetingScreen(),
      HistoryMeetingScreen(),
      CustomButton(
        text: 'Log Out',
        onPress: () async {
          await AuthMethods().signOut();
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          '${title[_page]}',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        onTap: onPageChanged,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _page == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: '${title[0]}',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _page == 1 ? Icons.watch_later : Icons.watch_later_outlined),
            label: '${title[1]}',
          ),
          BottomNavigationBarItem(
            icon: Icon(_page == 2 ? Icons.settings : Icons.settings_outlined),
            label: '${title[2]}',
          ),
        ],
      ),
    );
  }
}
