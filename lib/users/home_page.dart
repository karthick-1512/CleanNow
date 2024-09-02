import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m_app_event/dummy_data.dart';
import 'package:m_app_event/navbar.dart';
import 'package:m_app_event/report_form.dart';
import 'package:m_app_event/users/previous_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int count = whole_data.length;

class _HomePageState extends State<HomePage> {
  List<dynamic> test = [];
  Future<List<dynamic>> fetchData() async {
    String url = 'http://10.0.2.2:3000/details'; // Replace YOUR_LOCAL_IP

    try {
      // Send GET request to fetch data
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse JSON response
        List<dynamic> data = jsonDecode(response.body);
        test = data;
        // print(test);
        return data;
      } else {
        // Handle error
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception while fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      // floatingActionButton: ElevatedButton(
      //   style: ButtonStyle(
      //     fixedSize: MaterialStateProperty.all<Size>(
      //       Size(50, 50), // Fixed size (width, height)
      //     ),
      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //       RoundedRectangleBorder(
      //         borderRadius:
      //             BorderRadius.circular(20), // Adjust the radius as needed
      //       ),
      //     ),
      //     backgroundColor:
      //         MaterialStateProperty.all(const Color.fromARGB(255, 19, 2, 110)),
      //   ),
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //     size: 30,
      //     color: Color.fromARGB(255, 237, 248, 255),
      //   ),
      // ),
      drawer: NavBar(),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 2, 110),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(
              255, 237, 248, 255), // Change the drawer icon color here
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       setState(() {});
          //     },
          //     icon: const Icon(
          //       Icons.refresh_rounded,
          //       color: Colors.white,
          //     )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                fetchData();
                setState(() {
                  count += 1;
                });
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ReportForm();
                }));
              },
              child: Icon(
                Icons.add,
                color: Color.fromARGB(255, 237, 248, 255),
                size: 28,
              ),
            ),
          ),
        ],
        title: count > 0
            ? const Text(
                'Recents',
                style: TextStyle(
                  color: Color.fromARGB(255, 237, 248, 255),
                ),
              )
            : const Text(
                'WM App',
                style: TextStyle(
                  color: Color.fromARGB(255, 237, 248, 255),
                ),
              ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //       return EditProfilePage();
        //     }));
        //   },
        //   icon: const Icon(
        //     Icons.account_circle,
        //     color: Color.fromARGB(255, 237, 248, 255),
        //     size: 30,
        //   ),
        // ),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 2, 110),
      body: SingleChildScrollView(
          child: count > 0
              ? Column(
                  children: [
                    SizedBox(
                      height: screenSize.height,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32.0,
                          left: 32.0,
                          right: 32.0,
                        ),
                        child: ListView.builder(
                          itemCount: whole_data.length,
                          itemBuilder: (context, index) {
                            // Access individual data items and display them
                            Map<String, dynamic> item = whole_data[index];
                            final String cateo =
                                item['selectedCategory'].toString();
                            return Padding(
                              padding: EdgeInsets.all(16.0),
                              child: PreviousCard(
                                status: item['stat'],
                                subcat: item['selectedSubCategory'].toString(),
                                datu: item['date'].toString(),
                                cat: cateo,
                                lon: item['longitude'],
                                lat: item['latitude'],
                                img: item['image'],
                              ),
                            );
                          },
                        ),
                        // child: FutureBuilder<List<dynamic>>(
                        //   future: fetchData(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.connectionState ==
                        //         ConnectionState.waiting) {
                        //       // Show loading indicator while waiting for data
                        //       return Center(
                        //           child: CircularProgressIndicator());
                        //     } else if (snapshot.hasError) {
                        //       // Show error message if an error occurs
                        //       return Center(
                        //           child: Text('Error: ${snapshot.error}'));
                        //     } else {
                        //       // Display data using ListView
                        //       List<dynamic>? data = snapshot.data;
                        //       return Expanded(
                        //         child: ListView.builder(
                        //           itemCount: data!.length,
                        //           itemBuilder: (context, index) {
                        //             // Access individual data items and display them
                        //             Map<String, dynamic> item = data[index];
                        //             final String cateo =
                        //                 item['selectedCategory'].toString();
                        //             return Padding(
                        //               padding: EdgeInsets.all(16.0),
                        //               child: PreviousCard(
                        //                 status: item['stat'],
                        //                 subcat: item['selectedSubCategory']
                        //                     .toString(),
                        //                 datu: item['date'].toString(),
                        //                 cat: cateo,
                        //                 lon: item['longitude'],
                        //                 lat: item['latitude'],
                        //                 img: item['image'],
                        //               ),
                        //             );
                        //             // return Text('${item["pincode"]}');
                        //           },
                        //         ),
                        //       );
                        //     }
                        //   },
                        // )
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Center(child: Image.asset('assets/waste.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Help finding the garbage around you.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 237, 248, 255),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Swachh Bharat !!!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromARGB(255, 237, 248, 255),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
