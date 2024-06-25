import 'package:flutter/material.dart';

class GirdCardWidget extends StatelessWidget {
  const GirdCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'hai',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
