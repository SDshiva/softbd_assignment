import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soft_bd_assignment/provider/api_calling_provider.dart';
import 'package:soft_bd_assignment/provider/date_time_provider.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DataProvider>(context, listen: false).fetchData();
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<DateTimeProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.formattedCurrentDate,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.greenAccent,
                        Colors.green,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 3,
                        ),
                      ),
                    ),
                    child: const Text("নতুন যোগ করুন"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer<DateTimeProvider>(
              builder: (context, value, child) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.2),
                  color: Colors.white,
                  // shadowColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(value.dates.length, (index) {
                          bool isSelected = index == value.selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              value.setIndex(index); // Update selected index
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: isSelected
                                      ? Border.all(color: Colors.green)
                                      : null,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat.E('bn_BD')
                                                  .format(value.dates[index]) ==
                                              "বৃহস্পতি"
                                          ? "বৃহঃ"
                                          : DateFormat.E('bn_BD').format(value
                                                  .dates[
                                              index]), // Weekday name in Bengali
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        DateFormat.d('bn_BD').format(value
                                            .dates[index]), // Date in Bengali
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer<DateTimeProvider>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    value.currentDayActivities,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
            Consumer<DateTimeProvider>(
              builder: (context, value, child) {
                return Consumer<DataProvider>(
                  builder: (context, dataProvider, child) {
                    if (dataProvider.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (dataProvider.errorMessage.isNotEmpty) {
                      return Center(child: Text(dataProvider.errorMessage));
                    }

                    // Filter data based on selected date
                    final selectedDate = value.selectedDate;
                    final filteredData = dataProvider.dataItems.where((item) {
                      final itemDate =
                          DateTime.fromMillisecondsSinceEpoch(item.date * 1000);
                      return itemDate.year == selectedDate.year &&
                          itemDate.month == selectedDate.month &&
                          itemDate.day == selectedDate.day;
                    }).toList();

                    if (filteredData.isEmpty) {
                      return Center(child: Text('No data for selected date'));
                    }

                    // Display filtered data in ListView
                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final item = filteredData[index];
                          final date = DateTime.fromMillisecondsSinceEpoch(
                              item.date * 1000);
                          final time = DateFormat('h:mm', 'bn_BD').format(date);
                          return ListTile(
                            title: Text(item.name),
                            subtitle:
                                Text('${item.category} - ${item.location}'),
                            trailing: Text(time + " মি."),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
