import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final int currentStep;

  StatusWidget({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    // final int currentste=widget.currentStep;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Spacer(flex: 1),
            const Text(
              'Status:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              currentStep == 0
                  ? 'Submitted'
                  : currentStep == 1
                      ? 'In Progress'
                      : 'Completed',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDot(currentStep >= 0),
            _buildLine(currentStep >= 0),
            _buildLine(currentStep >= 1),
            _buildDot(currentStep >= 1),
            _buildLine(currentStep >= 1),
            _buildLine(currentStep >= 2),
            _buildDot(currentStep >= 2),
          ],
        ),
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color.fromARGB(255, 14, 208, 53) : Colors.black,
      ),
    );
  }

  Widget _buildLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Color.fromARGB(255, 14, 208, 53) : Colors.black,
      ),
    );
  }
}
