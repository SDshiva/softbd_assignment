import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Row(
          children: [
            Image.asset(
              "assets/demo.png",
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Flutter Task",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
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
      backgroundColor: Colors.grey,
    );
  }
}
