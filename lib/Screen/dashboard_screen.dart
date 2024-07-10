import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_assignment/provider/progress_provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<ProgressModelProvider>(context, listen: false);
    provider.setAnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
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
            const SizedBox(
              width: 10,
            ),
            const Text(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                shadowColor: Colors.black.withOpacity(0.2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/profile.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'মোঃ মোহাইমেনুল রেজা',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'সফটবিডি লিমিটেড',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'ঢাকা',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Consumer<ProgressModelProvider>(
                    builder: (context, value, child) {
                      return Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: CircularProgressIndicator(
                                    value: value
                                        .animationValue, // Adjust this value to change the progress
                                    strokeWidth: 10,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.green),
                                    backgroundColor: Colors.grey[200],
                                  ),
                                ),
                                const Text(
                                  '৬ মাস ৬ দিন', // Adjust the text as needed
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: const Text(
                                'সময় অতিবাহিত',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "মেয়াদকাল",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/calendar_inactive.png",
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০"),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "আরও বাকি",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade300,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      // alignment: Alignment.center,
                                      child: TextField(
                                        controller:
                                            TextEditingController(text: "০"),
                                        readOnly: true,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35.0,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      // alignment: Alignment.center,
                                      child: TextField(
                                        controller:
                                            TextEditingController(text: "৫"),
                                        readOnly: true,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35.0,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("বছর"),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      // alignment: Alignment.center,
                                      child: TextField(
                                        controller:
                                            TextEditingController(text: "০"),
                                        readOnly: true,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35.0,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      // alignment: Alignment.center,
                                      child: TextField(
                                        controller:
                                            TextEditingController(text: "৬"),
                                        readOnly: true,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35.0,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("মাস"),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      // alignment: Alignment.center,
                                      child: TextField(
                                        controller:
                                            TextEditingController(text: "১"),
                                        readOnly: true,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35.0,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      // alignment: Alignment.center,
                                      child: TextField(
                                        controller:
                                            TextEditingController(text: "২"),
                                        readOnly: true,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 35.0,
                                        ),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 10)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("দিন"),
                              ],
                            ),
                          ],
                        ),
                      ],
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
