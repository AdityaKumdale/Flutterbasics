import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
        automaticallyImplyLeading: false, //removing default back button
        leading: IconButton(
          //our own back button
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [   //adding more list of buttons in appBar
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //access multiple widgets
          children: [
            Image.asset('images/bat.jpg'),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Text is a text widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              //Replace 'Elevated' by 'Outline' or 'Text' Button to see difference
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.green : Colors.blue,
              ),
              onPressed: () {
                debugPrint(
                    'Elevated Button'); //Check Logcat or DebugConsole for debug Prints
              },
              child: const Text('Elevated Button'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque, //click works anywhere on row
              onTap: () {
                debugPrint('This is row on gesture');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  Text('Row widget'),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            Checkbox(
                value: isCheckbox,
                onChanged: (bool? newBool) {
                  setState(() {
                    isCheckbox = newBool;
                  });
                }),
            Image.network('https://www.shutterstock.com/shutterstock/photos/2317776003/display_1500/stock-vector-batman-head-logo-icon-t-shirt-sticker-design-famous-cartoon-super-hero-vector-illustration-2317776003.jpg')
          ],
        ),
      ),
    );
  }
}
