import 'package:flutter/material.dart';
import 'package:m_app_event/administrator/home_page.dart';
import 'package:m_app_event/home_bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: page == 0 ? AdministratorHomePage() : const MyHomePage(),
      // home: Mpp(),
    );
  }
}
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<dynamic> details = [];

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('http://localhost:3000/details'));

//     if (response.statusCode == 200) {
//       setState(() {
//         details = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to fetch data');
//     }
//   }

//   Future<void> addData(Map<String, dynamic> newData) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/details'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(newData),
//     );

//     if (response.statusCode == 200) {
//       fetchData(); // Refresh data after adding
//     } else {
//       throw Exception('Failed to add data');
//     }
//   }

//   Future<void> changeName(int age, String newName) async {
//     final response = await http.put(
//       Uri.parse(
//           'http://localhost:3000/details/$age'), // Assuming age is unique identifier
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'name': newName,
//       }),
//     );

//     if (response.statusCode == 200) {
//       fetchData(); // Refresh data after updating
//     } else {
//       throw Exception('Failed to change name');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Details:'),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: details.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text(details[index]['name']),
//                     subtitle: Text('Age: ${details[index]['age']}'),
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           String value = ''; // Define value variable here
//                           return AlertDialog(
//                             title: Text('Change Name'),
//                             content: TextField(
//                               decoration: InputDecoration(
//                                 hintText: 'Enter new name',
//                               ),
//                               onChanged: (newValue) {
//                                 value = newValue; // Update value variable
//                               },
//                             ),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: Text('Cancel'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                               TextButton(
//                                 child: Text('Save'),
//                                 onPressed: () {
//                                   if (details[index]['age'] != null) {
//                                     changeName(
//                                       details[index]['age'],
//                                       value, // Use value variable
//                                     );
//                                     Navigator.of(context).pop();
//                                   }
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Example of adding custom data
//           Map<String, dynamic> newData = {
//             'name': 'Jane Doe',
//             'age': 25,
//             'email': 'jane.doe@example.com',
//           };
//           addData(newData);
//         },
//         tooltip: 'Add Data',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
