import 'package:flutter/material.dart';

class ModalsAndDialogs extends StatelessWidget {
  const ModalsAndDialogs({super.key});

  showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you want to quit?"),
        content: Text("Are your sure do you want to close an app."),
        actions: [
          TextButton(onPressed: () {}, child: Text("Cancle")),
          TextButton(onPressed: () {}, child: Text("Yes"))
        ],
      ),
    );
  }

  showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Enter your name"),
              TextField(),
              FilledButton(
                onPressed: () {},
                child: Text("Ok"),
              ),
              Padding(
                // ADD THIS PADDING TO LIFT BOTTOM SHEET UP
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              showBottomSheet(context);
            },
            child: Text("show bottomsheet"),
          ),
          TextButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text("show Alert"),
          ),
        ],
      ),
    );
  }
}
