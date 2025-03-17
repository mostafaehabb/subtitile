import 'package:flutter/material.dart';
import 'package:subtitle/uploadPage.dart';

class subtitle extends StatefulWidget {
  const subtitle({super.key});

  @override
  State<subtitle> createState() => _subtitleState();
}

class _subtitleState extends State<subtitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: CircleAvatar(
            radius: 25,
          ),
        ),
        title: Column(
          children: [
            Text(
              'Hi, Laila',
              style: TextStyle(
                color: Color(0xFF0C0C0C),
                fontSize: 14,
                fontFamily: 'Inria Serif',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            Text(
              'dolores ratione officiis',
              style: TextStyle(
                color: Color(0xFF797979),
                fontSize: 12,
                fontFamily: 'Inria Sans',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.menu,
            size: 23,
            color: Colors.teal,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                'Subtitle',
                style: TextStyle(
                  color: Color(0xFF0A4627),
                  fontSize: 32,
                  fontFamily: 'Inria Serif',
                  fontWeight: FontWeight.w700,
                  height: 1.50,
                  letterSpacing: -0.61,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_circle_right_rounded),
                      ),
                      Image.asset(
                        "assets/OIP.jpeg",
                        width: 75,
                        height: 75,
                      ),
                      Text(
                        "Enter URL of video",
                        style: TextStyle(
                          color: Color(0xFF0A4627),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_circle_right_rounded),
                      ),
                      Image.asset(
                        "assets/OIP0.jpeg",
                        width: 75,
                        height: 75,
                      ),
                      Text(
                        "Select from history",
                        style: TextStyle(
                          color: Color(0xFF0A4627),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 108),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPickerPage()),
                          );
                        },
                        icon: Icon(Icons.arrow_circle_right_rounded),
                      ),
                      Image.asset(
                        "assets/gallery.jpeg",
                        width: 75,
                        height: 75,
                      ),
                      Text(
                        "Upload from gallery ",
                        style: TextStyle(
                          color: Color(0xFF0A4627),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
