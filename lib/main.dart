import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(              //const will never change
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home:const RootPage(),               //arguments in small letters,widgets in capital letters //we still need scaffold
    );
  }
}

class RootPage extends StatefulWidget {   //users refresh their screen
  const RootPage({Key? key}) : super(key:key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;   //always put variables before the build
  @override
  Widget build(BuildContext context) {
    //return Container();
    //return const Scaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: const HomePage(),         //Center of this screen is designed by different class HomePage in file called home_page.dart
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint('Floating action button');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
        ],
        onDestinationSelected: (int index){
          setState(() {              //cause our widget is not stateful(gets refreshed every time) hence we need this to traverse between home and person button
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

