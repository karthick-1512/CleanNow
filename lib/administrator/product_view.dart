import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m_app_event/maps/map_utils.dart';
import 'package:m_app_event/re.dart';

class AdministratorProductView extends StatefulWidget {
  final cat;
  final subcat;
  final status;
  final lon;
  final lat;
  final img;
  final datu;
  final id;
  const AdministratorProductView(
      {required this.cat,
      required this.id,
      required this.subcat,
      required this.status,
      required this.lon,
      required this.lat,
      required this.img,
      super.key,
      required this.datu});

  @override
  State<AdministratorProductView> createState() =>
      _AdministratorProductViewState();
}

class _AdministratorProductViewState extends State<AdministratorProductView> {
  bool _isLoading = false;
  String buttonName = 'ACCEPT';
  String buttonName1 = 'DECLINE';
  void dec() {
    // postDataToServer(widget.id.toString());
    Navigator.of(context).pop();
  }

  void fin() {
    reward++;
    updateRecord(widget.id.toString(), "2");
    Navigator.of(context).pop();
  }

  Future<void> updateRecord(String id, String stat) async {
    // URL of your Express server endpoint
    String url = 'http://10.0.2.2:3000/updateid';

    // Request body containing the ID and stat to update
    Map<String, dynamic> body = {
      'id': id,
      'stat': stat,
    };

    try {
      print(body);
      // Sending a POST request to update the record
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Record updated successfully
        print('Data updated successfully');
      } else {
        // Failed to update record, print error message
        print('Failed to update record: ${response.body}');
      }
    } catch (error) {
      // Handle error
      print('Error updating record: $error');
    }
  }

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });
    // Simulate a 2-second delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
        buttonName1 = 'START';
        buttonName = 'FINISHED';
      });
      updateRecord(widget.id.toString(), "1");
    });
  }

  // Future<void> postDataToServer(String id) async {
  //   // Your local server URL
  //   String url = 'http://10.0.2.2:3000/delete';

  //   // Your request body
  //   Map<String, dynamic> body = {
  //     'id': id,
  //   };

  //   try {
  //     // Make POST request
  //     var response = await http.post(
  //       Uri.parse(url),
  //       body: jsonEncode(body),
  //       headers: {'Content-Type': 'application/json'},
  //     );

  //     // Check if the request was successful
  //     if (response.statusCode == 200) {
  //       print('Data posted successfully');
  //     } else {
  //       print('Failed to post data. Status code: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error posting data: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final double l1 = double.parse(widget.lat);
    final double l2 = double.parse(widget.lon);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 237, 248, 255),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 19, 2, 110),
        title: Text(
          widget.cat.toString(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 237, 248, 255),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 2, 110),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  right: 32.0,
                  left: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 250,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(20, 20))),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(20, 20)),
                            child: Image.asset("assets/waste-1.jpg")),
                      ),
                    ),
                    SizedBox(
                      width: 900,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32.0,
                          right: 32.0,
                          left: 32.0,
                          top: 32.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              border: Border.all(
                                color: Colors.black38,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/wastebasket-objects.gif',
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Category',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 237, 248, 255),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '${widget.subcat.toString()}',
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 237, 248, 255),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 900,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32.0, left: 32.0, right: 32.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              border: Border.all(
                                color: Colors.black38,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/location-red (1).gif',
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 237, 248, 255),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Near 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 237, 248, 255),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 900,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32.0, left: 32.0, right: 32.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              border: Border.all(
                                color: Colors.black38,
                                width: 2,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons8-calendar.gif',
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Reported Date',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 237, 248, 255),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '${widget.datu.substring(0, 10)}',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 237, 248, 255),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                buttonName1 == 'DECLINE'
                                    ? dec()
                                    : MapUtils.openMap(l1, l2);
                              },
                              child: Text(buttonName1.toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              onPressed: () {
                                buttonName == 'ACCEPT'
                                    ? _startLoading()
                                    : fin();
                              },
                              child: Text(
                                buttonName.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
