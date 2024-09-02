import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m_app_event/administrator/adm_navbar.dart';
import 'package:m_app_event/administrator/duties_card.dart';
import 'package:m_app_event/administrator/product_view.dart';
import 'package:m_app_event/dummy_data.dart';

class AdministratorHomePage extends StatefulWidget {
  const AdministratorHomePage({super.key});

  @override
  State<AdministratorHomePage> createState() => _AdministratorHomePageState();
}

Future<List<dynamic>> fetchData() async {
  String url = 'http://10.0.2.2:3000/details'; // Replace YOUR_LOCAL_IP

  try {
    // Send GET request to fetch data
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse JSON response
      List<dynamic> data = jsonDecode(response.body);
      // test = data;
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

class _AdministratorHomePageState extends State<AdministratorHomePage> {
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
      drawer: NavBar_admin(),
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(
                255, 237, 248, 255), // Change the drawer icon color here
          ),
          backgroundColor: const Color.fromARGB(255, 19, 2, 110),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                ))
          ],
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           count += 1;
          //         });
          //       },
          //       child: Icon(
          //         Icons.add,
          //         color: Color.fromARGB(255, 237, 248, 255),
          //         size: 28,
          //       ),
          //     ),
          //   ),
          // ],
          title: const Text(
            'Admin Duties',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 248, 255),
            ),
          )
          // : const Text(
          //     'Duties',
          //     style: TextStyle(
          //       color: Color.fromARGB(255, 237, 248, 255),
          //     ),
          //   ),
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
          child: Column(
        children: [
          // SizedBox(
          //   height: screenSize.height,
          //   child: Padding(
          // padding: const EdgeInsets.only(
          //   bottom: 32.0,
          //   left: 32.0,
          //   right: 32.0,
          // ),
          //       child: FutureBuilder<List<dynamic>>(
          //         future: fetchData(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             // Show loading indicator while waiting for data
          //             return Center(child: CircularProgressIndicator());
          //           } else if (snapshot.hasError) {
          //             // Show error message if an error occurs
          //             return Center(child: Text('Error: ${snapshot.error}'));
          //           } else {
          //             // Display data using ListView
          //             List<dynamic>? data = snapshot.data;
          //             return Expanded(
          //               child: ListView.builder(
          //                 itemCount: data!.length,
          //                 itemBuilder: (context, index) {
          //                   // Access individual data items and display them
          //                   Map<String, dynamic> item = data[index];
          //                   final String cateo =
          //                       item['selectedCategory'].toString();
          //                   return Padding(
          //                     padding: EdgeInsets.all(16.0),
          //                     child: GestureDetector(
          //                       onTap: () {
          //                         Navigator.of(context).push(
          //                             MaterialPageRoute(builder: (context) {
          //                           return AdministratorProductView(
          //                             id: item['id'],
          //                             status: item['stat'],
          //                             subcat: item['selectedSubCategory']
          //                                 .toString(),
          //                             datu: item['date'].toString(),
          //                             cat: cateo,
          //                             lon: item['longitude'],
          //                             lat: item['latitude'],
          //                             img: item['image'],
          //                           );
          //                         }));
          //                       },
          //                       child: AdministratorDutiesCard(
          //                         id: item['id'],
          //                         status: item['stat'],
          //                         subcat:
          //                             item['selectedSubCategory'].toString(),
          //                         datu: item['date'].toString(),
          //                         cat: cateo,
          //                         lon: item['longitude'],
          //                         lat: item['latitude'],
          //                         img: item['image'],
          //                       ),
          //                     ),
          //                   );
          //                   // return Text('${item["pincode"]}');
          //                 },
          //               ),
          //             );
          //           }
          //         },
          //       )),
          // )
          SizedBox(
            height: screenSize.height,
            child: ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 32.0,
                left: 32.0,
                right: 32.0,
              ),
              itemCount: whole_data.length,
              itemBuilder: (context, index) {
                var item = whole_data[index];
                return Padding(
                  padding:
                      EdgeInsets.only(bottom: 16.0), // Adjust padding as needed
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return AdministratorProductView(
                              id: '1', // Update according to your logic
                              status: '1',
                              subcat: item['selectedSubCategory'].toString(),
                              // datu: item['date'].toString(),
                              cat: item['selectedCategory'].toString(),
                              lon: item['longitude'],
                              lat: item['latitude'],
                              img: item['image'],
                              datu: '2024-09-02 10:15:30.123456',
                              // address: item['address'],
                            );
                          },
                        ),
                      );
                    },
                    child: AdministratorDutiesCard(
                      id: item['stat'],
                      status: item['stat'],
                      subcat: item['selectedSubCategory'].toString(),
                      datu: item['date'].toString(),
                      cat: item['selectedCategory'].toString(),
                      lon: item['longitude'],
                      lat: item['latitude'],
                      img: item['image'],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )
          // : Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(32.0),
          //         child: Center(child: Image.asset('assets/sweeper_2.png')),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          //         child: Text(
          //           'No garbage around me.',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 18,
          //             color: Color.fromARGB(255, 237, 248, 255),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(
          //             top: 32.0, left: 32.0, right: 32.0),
          //         child: Text(
          //           'I am a Proud Citizen.',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 24,
          //             color: Color.fromARGB(255, 237, 248, 255),
          //           ),
          //         ),
          //       )
          //     ],
          //   )),
          ),
    );
  }
}
