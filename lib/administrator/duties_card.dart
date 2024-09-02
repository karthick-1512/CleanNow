import 'package:flutter/material.dart';
import 'package:m_app_event/users/status.dart';

class AdministratorDutiesCard extends StatefulWidget {
  final cat;
  final subcat;
  final status;
  final lon;
  final lat;
  final img;
  final datu;
  final id;

  const AdministratorDutiesCard(
      {required this.cat,
      required this.subcat,
      required this.status,
      required this.lon,
      required this.lat,
      required this.img,
      required this.id,
      super.key,
      required this.datu});

  @override
  State<AdministratorDutiesCard> createState() =>
      _AdministratorDutiesCardState();
}

class _AdministratorDutiesCardState extends State<AdministratorDutiesCard> {
  @override
  Widget build(BuildContext context) {
    final int st = int.parse(widget.status);
    final screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onDoubleTap: () {},
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 253, 253, 253),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  // MapUtils.openMap(l1, l2);
                                },
                                child: SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                    'assets/icons8-location.gif',
                                    fit: BoxFit.cover,
                                  ),
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
      ),
    );
  }
}
