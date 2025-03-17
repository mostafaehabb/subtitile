import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoUrlScreen(),
    );
  }
}

class VideoUrlScreen extends StatefulWidget {
  @override
  _VideoUrlScreenState createState() => _VideoUrlScreenState();
}

class _VideoUrlScreenState extends State<VideoUrlScreen> {
  final _urlController = TextEditingController();

  void _submitUrl() {
    String url = _urlController.text;
    if (url.isNotEmpty) {
      // Handle the URL submission
      print('Submitted URL: $url');
      // You can add further logic here, such as navigating to a video player screen
    } else {
      // Show an error message if the URL is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid URL')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Video URL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter URL of your video',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitUrl,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
