import 'home_page.dart';
import 'reports_page.dart';
import 'more/more_page.dart';
import 'appointement_page.dart';
import 'package:flutter/material.dart';
import 'package:hospital/screens/main.dart';
import 'package:hospital/constants/strings.dart';

class BaseHomeLayout extends StatefulWidget {
  const BaseHomeLayout({super.key});

  @override
  State<BaseHomeLayout> createState() => _BaseHomeLayoutState();
}

class _BaseHomeLayoutState extends State<BaseHomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.green[100],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: const Text(kAppName),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, kPagesNavLogin);
                    patientSharedPrefs.setBool(kPatientPrefrsIsLogged, false);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                    size: 29,
                  ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: kTabsHomeLabel,
                  backgroundColor: Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: kTabsAppointmentLabel,
                  backgroundColor: Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder),
                  label: kTabsFileLabel,
                  backgroundColor: Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_rounded),
                  label: kTabsMoreLabel,
                  backgroundColor: Colors.grey),
            ],
          ),
          body: pages[currentIndex]),
    );
  }

  List<Widget> pages = [
    const HomePage(),
    const AppointmentPage(),
    const ReportsPage(),
    const MorePage(),
  ];
}
