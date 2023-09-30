import 'package:basics/learn_flutter_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).push(     //Travel to mentioned page
            MaterialPageRoute(
                builder: (BuildContext context){
                  return const LearnFlutterPage();
                },
            ),
          );
        },
        child: const Text('Learn Flutter'),
      ),
    );
  }
}
