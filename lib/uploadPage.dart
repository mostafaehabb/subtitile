import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPickerPage extends StatefulWidget {
  @override
  _VideoPickerPageState createState() => _VideoPickerPageState();
}

class _VideoPickerPageState extends State<VideoPickerPage> {
  VideoPlayerController? _controller;
  String? _videoPath;
  String? _selectedLanguage;
  final List<String> _languages = ['Arabic', 'English', 'German', 'French'];
  final Map<String, bool> _selectedLanguages = {
    'Arabic': false,
    'English': false,
    'German': false,
    'French': false,
  };

  @override
  void initState() {
    super.initState();
    _pickVideo(); // اختيار الفيديو مباشرة عند فتح الصفحة
  }

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.single;

      // الحصول على المسار الفعلي للملف
      String? filePath = file.path;

      if (filePath != null) {
        setState(() {
          _videoPath = filePath;
          _controller?.dispose(); // تنظيف الموارد السابقة
          _controller = VideoPlayerController.file(
            File(_videoPath!),
          )..initialize().then((_) {
              setState(() {});
              _controller!.play(); // تشغيل الفيديو تلقائيًا بعد التحميل
            });
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Selected Video'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _controller != null && _controller!.value.isInitialized
                ? Column(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _controller!.value.isPlaying
                                ? _controller!.pause()
                                : _controller!.play();
                          });
                        },
                        child: Text(_controller!.value.isPlaying
                            ? 'Pause Video'
                            : 'Play Video'),
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                // Text(
                //   "Select languages ",
                //   style: TextStyle(fontSize: 20),
                // ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      _selectedLanguage = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return _languages.map((String language) {
                      return PopupMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _selectedLanguage ?? 'Select Language',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration:InputDecoration(border: OutlineInputBorder(),),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                // Api -- flask :

                

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(400, 50),
                backgroundColor: Color(0xFF3CAB72),
              ),
              child: Text(
                'Start',
                style: TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontSize: 15,
                  fontFamily: 'Inria Serif',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
