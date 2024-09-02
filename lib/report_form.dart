// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:m_app_event/dummy_data.dart';
import 'package:m_app_event/tick_page.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  String? _pincode;
  double? _latitude;
  double? _longitude;
  String? _selectedCategory;
  String? _selectedSubCategory;
  String? _imagePath;
  String? _description;
  String? _address;
  // String? _address;
  bool? _check = false;
  // void sendFileAndData() async {
  //   var url =
  //       'http://localhost:3000/insert'; // Replace with your Node.js server URL

  //   // File to be sent
  //   var file = File('assets/waste.png'); // Replace with the path to your file

  //   // JSON data to be sent
  //   Map<String, dynamic> jsonData = {
  //     'pincode': _pincode,
  //     'latitude': _latitude,
  //     'longitude': _longitude,
  //     'selectedCategory': _selectedCategory,
  //     'selectedSubCategory': _selectedSubCategory,
  //     'description': _description,
  //   };

  //   // Create a multipart request
  //   var request = http.MultipartRequest('POST', Uri.parse(url));

  //   // Add file to the request
  //   request.files.add(http.MultipartFile(
  //       'image', file.readAsBytes().asStream(), file.lengthSync(),
  //       filename: 'filename.jpg')); // Change the filename if needed

  //   // Add JSON data to the request
  //   // request.fields.addAll(jsonData);
  //   request.fields
  //       .addAll(jsonData.map((key, value) => MapEntry(key, value.toString())));

  //   // Send the request
  //   var response = await request.send();

  //   // Check the response status
  //   if (response.statusCode == 200) {
  //     print('File and data sent successfully');
  //   } else {
  //     print('Failed to send file and data. Error: ${response.reasonPhrase}');
  //   }
  // }
  Future<void> sendData1() async {
    // Define the JSON data
    Map<String, dynamic> jsonData = {
      'name': 'John Doe',
      'email': 'kai@gmail.com',
      'stat': 0,
    };

    // Convert JSON to string
    String jsonString = jsonEncode(jsonData);

    // Define the URL of your local server
    String url = 'http://10.0.2.2:3000/insert'; // Replace YOUR_LOCAL_IP

    // File to be sent
    Uint8List fileBytes = File(_imagePath!).readAsBytesSync();

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Add JSON data to the request
    // request.fields['data'] = jsonString;
    request.fields['pincode'] = _pincode!;
    request.fields['stat'] = "0";
    request.fields['latitude'] = _latitude.toString();
    request.fields['longitude'] = _longitude.toString();
    request.fields['selectedCategory'] = _selectedCategory!;
    request.fields['selectedSubCategory'] = _selectedSubCategory!;
    request.fields['description'] = _description!;
    request.fields['date'] = DateTime.now().toString();

    // Add file to the request
    request.files.add(http.MultipartFile.fromBytes(
      'image',
      fileBytes,
      filename: 'waste.png',
    ));

    // Send the request
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Data sent successfully');
      } else {
        print('Failed to send data. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception while sending data: $e');
    }
  }

  Future<void> sendData() async {
    // Define the JSON data
    // var file = File('assets/waste.png');
    Map<String, String> jsonD = {
      'pincode': _pincode ?? '', // Default to empty string if null
      'latitude': _latitude?.toString() ?? '', // Convert double to string
      'longitude': _longitude?.toString() ?? '', // Convert double to string
      'selectedCategory': _selectedCategory ?? '',
      'selectedSubCategory': _selectedSubCategory ?? '',
      'description': _description ?? '',
      'image': 'assets/sample_image.png',
      'stat': '0',
      'date': '2024-09-01 10:15:30.123456',
      'address': _address ?? ''
    };
    whole_data.add(jsonD);
    print(jsonD);

    // Convert JSON to string
    // String jsonString = jsonEncode(jsonData);

    // // Define the URL of your local server
    // String url = 'http://10.0.2.2:3000/insert'; // Replace YOUR_LOCAL_IP

    // // Send POST request
    // try {
    //   final response = await http.post(
    //     Uri.parse(url),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonString,
    //   );

    //   if (response.statusCode == 200) {
    //     print('Data sent successfully');
    //   } else {
    //     print('Failed to send data. Error: ${response.reasonPhrase}');
    //   }
    // } catch (e) {
    //   print('Exception while sending data: $e');
    // }
  }

  void getPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {}
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
    });
  }

  String? _selectedDate;
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
        'Report Form',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Department'),
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                  _selectedSubCategory = null;
                });
              },
              items: <String>[
                'Waste Management Department',
                'Road Management Department'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: _selectedCategory == 'Waste Management Department'
                  ? DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: 'Problem',
                          floatingLabelStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                      value: _selectedSubCategory,
                      onChanged: (value) {
                        setState(() {
                          _selectedSubCategory = value;
                        });
                      },
                      items: <String>[
                        'Chemical Disposal',
                        'Garbage dumping',
                        'Scrap Materials',
                        'Dead Organisms',
                        'Uncollected Waste',
                        'Other'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  : DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Problem'),
                      value: _selectedSubCategory,
                      onChanged: (value) {
                        setState(() {
                          _selectedSubCategory = value;
                        });
                      },
                      items: <String>[
                        'Potholes',
                        'Faulty lights',
                        'Work suspended',
                        'Others'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                height: 200.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: _imagePath == null
                          ? Center(child: Text('No image selected.'))
                          : Image.file(File(_imagePath!)),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () async {
                              final pickedFile = await ImagePicker()
                                  .getImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                setState(() {
                                  _imagePath = pickedFile.path;
                                });
                              }
                            }, //getImageFromCamera,
                          ),
                          IconButton(
                            icon: Icon(Icons.photo_library),
                            onPressed: () async {
                              final pickedFile = await ImagePicker()
                                  .getImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _imagePath = pickedFile.path;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: CheckboxListTile(
                  title: Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Add Current Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  value: _check,
                  onChanged: (val) {
                    setState(() {
                      _check = val;
                      if (_check == true) {
                        getPosition();
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Addresss';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value;
                },
                maxLines: null,
                maxLength: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value;
                },
                maxLines: null,
                maxLength: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Pincode'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 6) {
                    return 'Please enter a six-digit pincode';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _pincode = value;
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
            ),
            // Expanded(
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       final TimeOfDay? pickedTime = await showTimePicker(
            //         context: context,
            //         initialTime: _selectedTime == null
            //             ? TimeOfDay.now()
            //             : TimeOfDay.fromDateTime(
            //                 DateTime.parse(_selectedTime!)),
            //       );
            //       if (pickedTime != null) {
            //         setState(() {
            //           _selectedTime = pickedTime.format(context);
            //         });
            //       }
            //     },
            //     child: Text('Select Time'),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // if(_imagePath==null){SnackBarAction(label: label, onPressed: onPressed)}
                    _formKey.currentState!.save();
                    if (_selectedCategory == null ||
                        _selectedSubCategory == null ||
                        _description == null ||
                        _pincode == null) {
                      print('$_latitude');
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            duration: Duration(milliseconds: 1400),
                            content: Text('Kindly fill the all Details!!!')));
                    } else {
                      sendData();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Ani()),
                      );
                      // Navigator.pushNamed(
                      //   context,
                      //   '/confirm',
                      // );
                      //arguments: {
                      //   'Department': _selectedCategory,
                      //   'Problem': _selectedSubCategory,
                      //   'imagePath': _imagePath,
                      //   'Description': _description,
                      //   'Latitude': _latitude,
                      //   'Longitude': _longitude
                      // });
                    }

                    // print(_description);
                    // print(_latitude);
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
