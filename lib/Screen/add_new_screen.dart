import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _paragraphController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "নতুন যোগ করুন",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "অনুচ্চেদ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "৪৫ শব্দ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _paragraphController,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "অনুচ্চেদ লিখুন",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(45)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'অনুচ্ছেদ লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "অনুচ্ছেদের বিভাগ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _categoryController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () async {
                    final selectedCategory = await showDialog<String>(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text('অনুচ্ছেদের বিভাগ নির্বাচন করুন'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, 'শব্দ'),
                            child: const Text('শব্দ'),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, 'অনুচ্ছেদ'),
                            child: const Text('অনুচ্ছেদ'),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context, 'বাক্য'),
                            child: const Text('বাক্য'),
                          ),
                        ],
                      ),
                    );

                    if (selectedCategory != null) {
                      setState(() {
                        _categoryController.text = selectedCategory;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'অনুচ্ছেদের বিভাগ নির্বাচন করুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "তারিখ ও সময়",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      size: 16,
                      color: Colors.grey,
                    ),
                    hintText: "নির্বাচন করুন",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text =
                            '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'তারিখ ও সময় নির্বাচন করুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "স্থান",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _locationController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Colors.grey,
                    ),
                    hintText: "নির্বাচন করুন",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () async {
                    final selectedLocation = await showDialog<String>(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text('স্থান নির্বাচন করুন'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () =>
                                Navigator.pop(context, 'ঢাকা, বাংলাদেশ'),
                            child: const Text('ঢাকা, বাংলাদেশ'),
                          ),
                          SimpleDialogOption(
                            onPressed: () =>
                                Navigator.pop(context, 'চট্টগ্রাম, বাংলাদেশ'),
                            child: const Text('চট্টগ্রাম, বাংলাদেশ'),
                          ),
                          SimpleDialogOption(
                            onPressed: () =>
                                Navigator.pop(context, 'রাজশাহী, বাংলাদেশ'),
                            child: const Text('রাজশাহী, বাংলাদেশ'),
                          ),
                        ],
                      ),
                    );

                    if (selectedLocation != null) {
                      setState(() {
                        _locationController.text = selectedLocation;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'স্থান নির্বাচন করুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "অনুচ্ছেদের বিবরণ লিখুন",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "১২০ শব্দ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "কার্যক্রমের বিবরণ লিখুন",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(120)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'অনুচ্ছেদের বিবরণ লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF79AA5C),
                          Color(0xFF427C4E),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _paragraphController.text = "";
                            _categoryController.text = "";
                            _dateController.text = "";
                            _locationController.text = "";
                            _descriptionController.text = "";
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/success.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "নতুন অনুচ্ছেদ সংরক্ষন",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পূর্ণ হয়েছে",
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF79AA5C),
                                          Color(0xFF427C4E),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 12),
                                        ),
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      child: const Text("আরও যোগ করুন"),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 3,
                          ),
                        ),
                      ),
                      child: const Text("সংরক্ষন করুন"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
