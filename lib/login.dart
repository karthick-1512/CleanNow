import "package:flutter/material.dart";
import "package:m_app_event/administrator/home_page.dart";
import "package:m_app_event/home_bottom.dart";

// class Mpp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Page',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Color.fromARGB(255, 125, 184, 251),
//       ),
//       home: LoginPage(),
//     );
//   }
// }

class Mpp extends StatefulWidget {
  @override
  _MppState createState() => _MppState();
}

class _MppState extends State<Mpp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 125, 184, 251),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
              color: Color.fromRGBO(47, 140, 246, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        // scaffoldBackgroundColor: Color.fromARGB(255, 125, 184, 251),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
              obscureText: true,
            ),
            const SizedBox(
              height: 130,
            ),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                username == "admin"
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdministratorHomePage()),
                      )
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );

                // Do something with the username and password here
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
