import 'package:flutter/material.dart';

class ScrollControllerScreen extends StatefulWidget {
  const ScrollControllerScreen({super.key});

  @override
  State<ScrollControllerScreen> createState() => _ScrollControllerScreenState();
}

class _ScrollControllerScreenState extends State<ScrollControllerScreen> {
  final scrollController = ScrollController();
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(!_isVisible && scrollController.position.pixels > 200) {
        setState(() {
          _isVisible = true;
        });
      }
      if(_isVisible && scrollController.position.pixels<=200) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _isVisible ? FloatingActionButton(
            child: const Icon(Icons.arrow_upward), onPressed: () {
          scrollController.animateTo(
              0, duration: const Duration(milliseconds: 200),
              curve: Curves.bounceIn);
        }) : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(index: index + 1);
            }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;

  const ListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: theme.primaryColor),
          child: SizedBox(
            height: 50,
            child: Center(
                child: Text(
                  "item $index",
                  style: theme.textTheme.labelLarge
                      ?.copyWith(color: theme.primaryColorLight),
                )),
          )),
    );
  }
}
