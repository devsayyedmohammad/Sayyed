import 'package:flutter/material.dart';

class InputWidgets extends StatefulWidget {
  InputWidgets({super.key});

  @override
  State<InputWidgets> createState() => _InputWidgetsState();
}

class _InputWidgetsState extends State<InputWidgets> {
  TextEditingController textfield = TextEditingController();
  TextEditingController datefield = TextEditingController();
  TextEditingController timefield = TextEditingController();

  String? selectedMonth;

  bool isSlectedCheckBox = false;

  List<int> selectedDays = [];

  int selectedDay = -1;

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Texfield",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              textField(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Two Texfields in Row",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(child: textField()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: textField()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Drop down button",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              dropdownField(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Drop down button in row",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(child: dropdownField()),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(child: dropdownField()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Check Box",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    days.length,
                    (index) => Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: selectedDays.contains(index),
                          onChanged: (value) {
                            if (selectedDays.contains(index)) {
                              selectedDays.remove(index);
                            } else {
                              selectedDays.add(index);
                            }
                            setState(() {});
                          },
                        ),
                        Text(days[index])
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Check Box List Tile",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: selectedDays.contains(0),
                onChanged: (index) {},
                title: Text("Ice cream"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Radio Button",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              ...List.generate(
                days.length,
                (index) => RadioListTile(
                  title: Text(days[index]),
                  value: index,
                  groupValue: selectedDay,
                  onChanged: (value) {
                    selectedDay = value!;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Date picker",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                readOnly: false,
                controller: datefield,
                onTap: () async {
                  // function to pick date
                  DateTime? dateTime = await showDatePicker(
                      context: context,
                      lastDate: DateTime.now(),
                      firstDate: DateTime(2000));
                  if (dateTime != null) {
                    datefield.text =
                        "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Time picker",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                readOnly: false,
                controller: timefield,
                onTap: () async {
                  // function to pick date
                  TimeOfDay? tod = await showTimePicker(
                      initialEntryMode: TimePickerEntryMode.inputOnly,
                      context: context,
                      initialTime: TimeOfDay.now());
                  if (tod != null) {
                    timefield.text = "${tod.hour}:${tod.minute}";
                  }
                },
              ),
              SizedBox(
                height: 100,
              ),
              DateRangePickerDialog(
                  lastDate: DateTime.now(), firstDate: DateTime(2000))
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> dropdownField() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: "Enter your name",
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      ),
      isExpanded: true,
      hint: Text("Select month"),
      value: selectedMonth,
      items: months
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
      onChanged: (value) {
        selectedMonth = value;
        setState(() {});
      },
    );
  }

  TextField textField() {
    return TextField(
      // readOnly: true,
      cursorColor: Colors.blueAccent,
      controller: textfield, //
      // keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.characters,
      maxLength: 100, //
      obscuringCharacter: "*",
      maxLines: 1,
      style: TextStyle(color: Colors.red),
      decoration: InputDecoration(
        label: Text("Email"),
        prefixIcon: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            child: Text("+91")),
        hintText: "Enter your name",
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      ),
    );
  }
}
