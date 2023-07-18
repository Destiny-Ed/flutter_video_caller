import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caller/screens/call_page.dart';
import 'package:flutter_caller/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController roomController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: roomController,
              decoration: const InputDecoration(label: Text("Enter Room Id")),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(label: Text("Enter Username")),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      if (nameController.text.isEmpty || roomController.text.isEmpty) {
                        message(context, "All fields are required");
                      } else {
                        ///Navigate to call page
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CallPage(
                              roomId: roomController.text.trim(),
                              name: nameController.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Join Meeting")),
                TextButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        message(context, "Name field is required");
                      } else {
                        //navigate
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CallPage(
                              name: nameController.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Create Meeting"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void message(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
