import 'package:flutter/material.dart';

List<String> categories = [
  "Electronics",
  "Furniture",
  "Clothing",
  "Footwear",
  "Groceries",
  "Toys",
  "Books",
  "Stationery",
  "Automotive",
  "Beauty & Personal Care",
  "Home Appliances",
  "Sports Equipment",
  "Outdoor Gear",
  "Jewelry",
  "Pet Supplies",
  "Health & Wellness",
  "Musical Instruments",
  "Garden Supplies",
  "Office Supplies",
  "Art & Craft Supplies"
];

class Selectors extends StatefulWidget {
  Selectors({super.key});

  @override
  State<Selectors> createState() => _SelectorsState();
}

class _SelectorsState extends State<Selectors> {
  int selectedCategoryIndex = 0;

  List<int> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E MART"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Only One Element Can be selected"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  categories.length,
                  (index) => Container(
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: index == selectedCategoryIndex
                          ? Colors.black87
                          : Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          selectedCategoryIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: index == selectedCategoryIndex
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Multiple Element Can be selected"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (selectedCategories.contains(index)) {
                      selectedCategories.remove(index);
                    } else {
                      selectedCategories.add(index);
                    }

                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: selectedCategories.contains(index)
                          ? Colors.black87
                          : Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          color: selectedCategories.contains(index)
                              ? Colors.white
                              : Colors.black87),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Selected Single Category : ${categories[selectedCategoryIndex]}",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Selected Multiple Categories Category : ",
            ),
            ...List.generate(
              selectedCategories.length,
              (index) => Text(
                categories[selectedCategories[index]],
              ),
            )
          ],
        ),
      ),
    );
  }
}
