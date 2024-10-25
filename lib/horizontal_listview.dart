import 'package:flutter/material.dart';

class HorizontalListViewScreen extends StatelessWidget {
  const HorizontalListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(index: index + 1);
              }),
        ),
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
            width: 80,
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
