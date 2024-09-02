import 'package:flutter/material.dart';
import 'package:m_app_event/Ai_text.dart';
import 'package:m_app_event/users/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  int navig_icon = 0;
  List<Widget> pages = [HomePage(), const TextOnly()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(cartu);
    return Scaffold(
      body: IndexedStack(
        index: navig_icon,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color.fromARGB(255, 248, 233, 185),
        currentIndex: navig_icon,
        onTap: (value) {
          setState(() {
            navig_icon = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.text_fields), label: 'Assistant'),
        ],
      ),
    );
  }
}
