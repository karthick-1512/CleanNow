import 'package:flutter/material.dart';
import 'package:m_app_event/maps/map_utils.dart';
import 'package:m_app_event/users/status.dart';

class PreviousCard extends StatefulWidget {
  final String cat;
  final String subcat;
  final String datu;
  final String lon;
  final String lat;
  final String img;
  final String status;

  const PreviousCard(
      {super.key,
      required this.cat,
      required this.datu,
      required this.subcat,
      required this.lon,
      required this.lat,
      required this.img,
      required this.status});

  @override
  State<PreviousCard> createState() => _PreviousCardState();
}

class _PreviousCardState extends State<PreviousCard> {
  @override
  Widget build(BuildContext context) {
    final int st = int.parse(widget.status);
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 241, 209),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            const Spacer(),
            Text(
              "              ${widget.cat}",
              style: TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        minRadius: 50,
                        backgroundImage: AssetImage("assets/waste-1.jpg"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date:${widget.datu.substring(0, 10)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      'Category:${widget.subcat}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                MapUtils.openMap(double.parse(widget.lat),
                                    double.parse(widget.lon));
                              },
                              child: SizedBox(
                                height: 30,
                                child: Image.asset(
                                  'assets/icons8-location.gif',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              '   Pincode: 600115',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            StatusWidget(currentStep: st),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
