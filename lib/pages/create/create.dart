import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_error/pages/create/controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.contentController,
              maxLines: 5, // Allowing multiple lines for content
              decoration: InputDecoration(
                labelText: "Content",
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: controller.onSubmit,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              child: Text("Submit", style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ),
    );
  }
}
