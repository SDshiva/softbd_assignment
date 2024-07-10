import 'package:flutter/material.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
          ),
        ),
        title: Text(
          "সময়রেখা",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/notification_with_dot.png",
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
