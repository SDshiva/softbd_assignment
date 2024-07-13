class DataItem {
  // final DateTime date;
  final int date;
  final String name;
  final String category;
  final String location;

  DataItem({
    required this.date,
    required this.name,
    required this.category,
    required this.location,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
        // date:
        //     DateTime.fromMillisecondsSinceEpoch(int.parse(json['date'] * 1000)),
        date: int.parse(json['date']),
        name: json['name'],
        category: json['category'],
        location: json['location']);
  }
}
