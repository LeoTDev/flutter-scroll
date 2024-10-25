import 'package:flutter/material.dart';
import 'package:scrolldemo/horizontal_listview.dart';
import 'package:scrolldemo/listview.dart';
import 'package:scrolldemo/listview_refreshindicator.dart';
import 'package:scrolldemo/login.dart';
import 'package:scrolldemo/scrollcontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrolling"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: const Text("Login")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ListViewScreen()));
                  },
                  child: const Text("List")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const ListViewWithRefreshIndicatorScreen()));
                  },
                  child: const Text("List with RefreshIndicator ")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                        const HorizontalListViewScreen()));
                  },
                  child: const Text("Horizontal List")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                        const ScrollControllerScreen()));
                  },
                  child: const Text("Scroll Controller")),
            ],
          ),
        ),
      ),
    );
  }
}
